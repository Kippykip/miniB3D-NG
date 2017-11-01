
' 3DS Chunks

Const M3D_3DS_RGB3F = $0010
Const M3D_3DS_RGB3B           = $0011
Const M3D_3DS_RGBGAMMA3B        = $0012
Const M3D_3DS_RGBGAMMA3F        = $0013
Const M3D_3DS_PERCENTI          = $0030
Const M3D_3DS_PERCENTF          = $0031
Const M3D_3DS_MAIN              = $4D4D
Const M3D_3DS_3DEDITOR          = $3D3D
Const M3D_3DS_OBJECTBLOCK       = $4000
Const M3D_3DS_TRIMESH           = $4100
Const M3D_3DS_VERTEXLIST        = $4110
Const M3D_3DS_FACELIST          = $4120
Const M3D_3DS_FACEMATLIST       = $4130
Const M3D_3DS_TEXCOORDS         = $4140
Const M3D_3DS_BrushBLOCK     = $AFFF
Const M3D_3DS_BrushNAME      = $A000
Const M3D_3DS_BrushAMBIENT   = $A010
Const M3D_3DS_BrushDIFFUSE   = $A020
Const M3D_3DS_BrushSPECULAR  = $A030
Const M3D_3DS_BrushSHININESS = $A040
Const M3D_3DS_TEXTUREMAP1       = $A200
Const M3D_3DS_TEXTUREMAP2       = $A33A
Const M3D_3DS_MAPFILENAME       = $A300
Const M3D_3DS_MAPVSCALE         = $A354
Const M3D_3DS_MAPUSCALE         = $A356
Const M3D_3DS_MAPUOFFSET        = $A358
Const M3D_3DS_MAPVOFFSET        = $A35A
Const M3D_3DS_MAPROTATION       = $A35C

Type T3DSLoader
	Field Stream        : TStream
	Field ChunkID       : Short
	Field ChunkSize     : Int
	Field Surface       : TSurface
	Field VertexCount   : Int
	Field TriangleCount : Int
	Field Mesh          : TMesh
	Field Brush      : TBrush
	Field Brushs     : TList
	Field TextureLayer  : Int
	Field Texture       : TTexture

	Method ReadChunk()
		Self.ChunkID   = Self.Stream.ReadShort()
		Self.ChunkSize = Self.Stream.ReadInt()
	End Method

	Method ScipChunk()
		Self.Stream.Seek(Self.Stream.Pos()+Self.ChunkSize-6)
	End Method

	Method ReadCString:String()
		Local Char:Byte, CString:String

		' Null-Terminated-String
		While Not Self.Stream.Eof()
			Char = Self.Stream.ReadByte()
			If Char = 0 Then Exit
			CString :+ Chr(Char)
		Wend

		Return CString
	End Method

	Method ReadRGB(Format:Int, Red:Float Var, Green:Float Var, Blue:Float Var)
		Select Format
			Case M3D_3DS_RGB3F
				Red   = Self.Stream.ReadFloat()
				Green = Self.Stream.ReadFloat()
				Blue  = Self.Stream.ReadFloat()

			Case M3D_3DS_RGB3B
				Red   = Float(Self.Stream.ReadByte())/255.0
				Green = Float(Self.Stream.ReadByte())/255.0
				Blue  = Float(Self.Stream.ReadByte())/255.0

			Case M3D_3DS_RGBGAMMA3F
				Red   = Self.Stream.ReadFloat()
				Green = Self.Stream.ReadFloat()
				Blue  = Self.Stream.ReadFloat()

			Case M3D_3DS_RGBGAMMA3B
				Red   = Float(Self.Stream.ReadByte())/255.0
				Green = Float(Self.Stream.ReadByte())/255.0
				Blue  = Float(Self.Stream.ReadByte())/255.0

			Default
				Self.ScipChunk()
		End Select
	End Method

	Method ReadPercent:Float(Format:Int)
		Select Format
			Case M3D_3DS_PERCENTI
				Return Float(Self.Stream.ReadShort())/100.0
				
			Case M3D_3DS_PERCENTF
				Return Self.Stream.ReadFloat()/100.0
				
			Default
				Self.ScipChunk()
				Return 0.0
		End Select
	End Method

	Method ReadVertexList()
		Local Index:Int, Position:Float[3]

		Self.VertexCount = Self.Stream.ReadShort()

		For Index = 0 To Self.VertexCount-1
			Position[0] = Self.Stream.ReadFloat()
			Position[1] = Self.Stream.ReadFloat()
			Position[2] = Self.Stream.ReadFloat()
			
			Self.Surface.AddVertex(Position[0], Position[1], Position[2])
		Next

'		Self.Surface.UpdateVertices()
	End Method

	Method ReadFaceList()
		Local Index:Int, Indices:Int[3]

		Self.TriangleCount = Self.Stream.ReadShort()
		For Index = 0 To Self.TriangleCount-1
			Indices[0] = Self.Stream.ReadShort()
			Indices[1] = Self.Stream.ReadShort()
			Indices[2] = Self.Stream.ReadShort()
			Self.Stream.ReadShort() ' FaceFlags

			Self.Surface.AddTriangle(Indices[0], Indices[1], Indices[2])
		Next

'		Self.Surface.UpdateTriangles()
		'Self.Surface.SmoothNormals()
	End Method

	Method ReadFaceMatList()
		Local Name:String, Brush:TBrush, Found:Int, Count:Int

		Name = Self.ReadCString()
		Print Name

		' Search for the BrushName
		Found = False
		
		For Brush = EachIn Self.Brushs
			If Brush.Name = Name Then
				Found = True
				Exit
			EndIf
		Next
		
		If Found Then Self.Mesh.PaintMesh(Brush)

		Count = Self.Stream.ReadShort()
		Self.Stream.Seek(Self.Stream.Pos()+Count*2)
	End Method

	Method ReadTexCoords()
		Local Count:Int, Index:Int, U:Float, V:Float

		Count = Self.Stream.ReadShort()
		For Index = 0 To Count-1
			U = Self.Stream.ReadFloat()
			V = -Self.Stream.ReadFloat()

			Self.Surface.VertexTexCoords(Index, U, V,0, 0)
			Self.Surface.VertexTexCoords(Index, U, V,0, 1)
		Next

'		Self.Surface.UpdateVertices(False, False, True, True, False, False)
	End Method

	Method LoadMap()
		Local Filename:String, Pixmap:Int

		Filename = Self.ReadCString()
		Pixmap = FileType(Filename)
		Print Filename

		If Pixmap <> 0 Then
			Self.Texture = LoadTexture(Filename,4)
			
			If Self.TextureLayer = M3D_3DS_TEXTUREMAP1 Then
				' Layer 0
				Self.Brush.BrushTexture(Self.Texture, 0)
			Else
				' Layer 1
				Self.Brush.BrushTexture(Self.Texture, 1)
			EndIf
		EndIf
	End Method

	Method ReadMap(Layer:Int)
		Self.Texture      = New TTexture
		Self.TextureLayer = Layer
	End Method

	Method ReadTriMesh()
		Self.Surface = Self.Mesh.CreateSurface()
	End Method

	Method ReadBrushBlock()
		Self.Brush = CreateBrush()' TBrush
		Self.Brushs.AddLast(Self.Brush)
	End Method

	Method New()
		Self.Stream        = Null
		Self.ChunkID       = 0
		Self.ChunkSize     = 0
		Self.Surface       = Null
		Self.VertexCount   = 0
		Self.TriangleCount = 0
		Self.Mesh          = Null
		Self.Brush      = Null
		Self.Brushs     = CreateList()
		Self.TextureLayer  = 0
		Self.Texture       = Null
	End Method

	Function Load:TMesh(URL:Object)
		Local Loader:T3DSLoader, Size:Int
		Local OldDir:String
		Local Red:Float, Green:Float, Blue:Float, Percent:Float
		Local Pixmap:TPixmap

		Loader = New T3DSLoader

		Loader.Stream = ReadFile(URL)
		If Loader.Stream = Null Then Return Null

		Size = Loader.Stream.Size()

		' Read Main-Chunk
		Loader.ReadChunk()
		If (Loader.ChunkID <> M3D_3DS_MAIN) Or (Loader.ChunkSize <> Size) Then
			Loader.Stream.Close()
			Print "No 3DS File"
			Return Null
		EndIf

		' Find 3DEditor-Chunk
		While Not Loader.Stream.Eof()
			Loader.ReadChunk()
			If Loader.ChunkID = M3D_3DS_3DEDITOR Then
				Exit
			Else
				Loader.ScipChunk()
			EndIf
		Wend

		OldDir = CurrentDir()
		If String(URL) <> "" Then ChangeDir(ExtractDir(String(URL)))

		Loader.Mesh = CreateMesh()

		While Not Loader.Stream.Eof()
			Loader.ReadChunk()

			Select Loader.ChunkID
				Case M3D_3DS_OBJECTBLOCK
					Loader.ReadCString() ' ObjectName

				Case M3D_3DS_BrushBLOCK
					Loader.ReadBrushBlock()

				Case M3D_3DS_TRIMESH
					Loader.ReadTriMesh()

				Case M3D_3DS_VERTEXLIST
					Loader.ReadVertexList()

				Case M3D_3DS_FACELIST
					Loader.ReadFaceList()

				Case M3D_3DS_FACEMATLIST
					Loader.ReadFaceMatList()

				Case M3D_3DS_TEXCOORDS
					Loader.ReadTexCoords()

				Case M3D_3DS_BrushNAME
					'Loader.Brush = CreateBrush()
					Loader.Brush.Name = Loader.ReadCString()

				Case M3D_3DS_BrushAMBIENT
					'Loader.ReadChunk()
					'Loader.ReadRGB(Loader.ChunkID, Red, Green, Blue)
					'Loader.Brush.SetAmbientColor(Red, Green, Blue)

				Case M3D_3DS_BrushDIFFUSE
					'Loader.ReadChunk()
					'Loader.ReadRGB(Loader.ChunkID, Red, Green, Blue)
					'Loader.Brush.BrushColor(Red, Green, Blue)

				Case M3D_3DS_BrushSPECULAR
					'Loader.ReadChunk()
					'Loader.ReadRGB(Loader.ChunkID, Red, Green, Blue)
					'Loader.Brush.SetSpecularColor(Red, Green, Blue)

				Case M3D_3DS_BrushSHININESS
					'Loader.ReadChunk()
					'Percent = Loader.ReadPercent(Loader.ChunkID)
					'Loader.Brush.BrushShininess(Percent)

				Case M3D_3DS_MAPFILENAME
					Loader.LoadMap()

				Case M3D_3DS_MAPVSCALE
					Loader.Texture.v_Scale = Loader.Stream.ReadFloat()

				Case M3D_3DS_MAPUSCALE
					Loader.Texture.U_Scale = Loader.Stream.ReadFloat()

				Case M3D_3DS_MAPUOFFSET
					Loader.Texture.U_Pos = Loader.Stream.ReadFloat()

				Case M3D_3DS_MAPVOFFSET
					Loader.Texture.V_Pos = Loader.Stream.ReadFloat()

				Case M3D_3DS_MAPROTATION
					Loader.Texture.angle = Loader.Stream.ReadFloat()

				Default
					If (Loader.ChunkID = M3D_3DS_TEXTUREMAP1) Or ..
					   (Loader.ChunkID = M3D_3DS_TEXTUREMAP2) Then
						Loader.ReadMap(Loader.ChunkID)
					Else
						Loader.ScipChunk()
					EndIf
			End Select
		Wend

		Loader.Stream.Close()
		ChangeDir(OldDir)
'		Loader.Surface.UpdateVertices()
'		Loader.Surface.UpdateTriangles()
		Loader.Mesh.UpdateNormals()
		'Loader.Mesh.UpdateBuffer()
		
		Print Loader.Surface.Tris.Length
		Print Loader.Surface.no_verts
		'Loader.Mesh.FlipMesh()

		Return Loader.Mesh
	End Function
End Type

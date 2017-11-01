' Procedural Interfaces

Rem
bbdoc: Minib3d Only
about:
This command is included as MiniB3D currently does not have the same buffer commands as Blitz3D.

Use this command to copy a region of the backbuffer to a texture.

The region copied from the backbuffer will start at (0,0), and end at the texture's width and height.

Therefore if you want to copy the whole of a 3D scene to a texture, you must first resize the camera viewport to the size of 
the texture, use RenderWorld to render the camera, then use this command to copy the backbuffer to the texture.

Note that if a texture has the mipmap flag enabled (by default it does), then this command must be called for each mipmap,
otherwise the texture will appear to fade into a different, non-matching mipmap as you move away from it. A routine similar to
the one below will copy the backbuffer to each mipmap, making sure the camera viewport is the same size as the mipmap.

For i=0 Until tex.CountMipmaps()
	CameraViewport 0,0,tex.MipmapWidth(),tex.MipmapHeight()
	Renderworld
	BackBufferToTex(tex,i)
Next

It may be easier to disable the mipmap flag for the texture. To do so, use ClearTextureFilters after calling Graphics3D 
(the mipmap flag is a default filter).

If you are using this command to copy to a cubemap texture, use SetCubeFace to first select which portion of the texture you
will be copying to. Note that in MiniB3D mipmaps are not used by cubemaps, so ignore the information about mipmaps for normal 
textures above.

See the cubemap.bmx example included with MiniB3D to learn more about cubemapping.
End Rem
Function BackBufferToTex(tex:TTexture,mipmap_no:Int=0,frame:Int=0)
	tex.BackBufferToTex(mipmap_no,frame)
End Function

Rem
bbdoc: Minib3d Only
about:
This command is the equivalent of Blitz3D's MeshCullBox command.

It is used to set the radius of a mesh's 'cull sphere' - if the 'cull sphere' is not inside the viewing area, the mesh will not 
be rendered.

A mesh's cull radius is set automatically, therefore in most cases you will not have to use this command.

One time you may have to use it is for animated meshes where the default cull radius may not take into account all animation 
positions, resulting in the mesh being wrongly culled at extreme positions.
End Rem
Function MeshCullRadius(ent:TEntity,radius#)
	ent.MeshCullRadius(radius#)
End Function

' Blitz3D functions, A-Z

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AddMesh.htm">Online Help</a>
End Rem
Function AddMesh:TMesh(mesh1:TMesh,mesh2:TMesh)
	mesh1.AddMesh(mesh2)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AddTriangle.htm">Online Help</a>
End Rem
Function AddTriangle:Int(surf:TSurface,v0:Int,v1:Int,v2:Int)
	Return surf.AddTriangle(v0,v1,v2)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AddVertex.htm">Online Help</a>
End Rem
Function AddVertex:Int(surf:TSurface,x#,y#,z#,u#=0.0,v#=0.0,w#=0.0)
	Return surf.AddVertex(x#,y#,z#,u#,v#,w#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AmbientLight.htm">Online Help</a>
End Rem
Function AmbientLight(r#,g#,b#)
	TGlobal.AmbientLight(r#,g#,b#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AntiAlias.htm">Online Help</a>
End Rem
Function AntiAlias(samples:Int)
	TGlobal.AntiAlias(samples)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/Animate.htm">Online Help</a>
End Rem
Function Animate(ent:TEntity,mode:Int=1,speed#=1.0,seq:Int=0,trans:Int=0)
	ent.Animate(mode:Int,speed#,seq:Int,trans:Int)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/Animating.htm">Online Help</a>
End Rem
Function Animating:Int(ent:TEntity)
	Return ent.Animating()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AnimLength.htm">Online Help</a>
End Rem
Function AnimLength:Int(ent:TEntity)
	Return ent.AnimLength()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AnimSeq.htm">Online Help</a>
End Rem
Function AnimSeq:Int(ent:TEntity)
	Return ent.AnimSeq()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AnimTime.htm">Online Help</a>
End Rem
Function AnimTime#(ent:TEntity)
	Return ent.AnimTime#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushAlpha.htm">Online Help</a>
End Rem
Function BrushAlpha(brush:TBrush,a#)
	brush.BrushAlpha(a#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushBlend.htm">Online Help</a>
End Rem
Function BrushBlend(brush:TBrush,blend:Int)
	brush.BrushBlend(blend)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushColor.htm">Online Help</a>
End Rem
Function BrushColor(brush:TBrush,r#,g#,b#)
	brush.BrushColor(r#,g#,b#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushFX.htm">Online Help</a>
End Rem
Function BrushFX(brush:TBrush,fx:Int)
	brush.BrushFX(fx)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushShininess.htm">Online Help</a>
End Rem
Function BrushShininess(brush:TBrush,s#)
	brush.BrushShininess(s#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/BrushTexture.htm">Online Help</a>
End Rem
Function BrushTexture(brush:TBrush,tex:TTexture,frame:Int=0,index:Int=0)
	brush.BrushTexture(tex,frame,index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraClsColor.htm">Online Help</a>
End Rem
Function CameraClsColor(cam:TCamera,r#,g#,b#)
	cam.CameraClsColor(r#,g#,b#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraClsMode.htm">Online Help</a>
End Rem
Function CameraClsMode(cam:TCamera,cls_depth:Int,cls_zbuffer:Int)
	cam.CameraClsMode(cls_depth,cls_zbuffer)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraFogColor.htm">Online Help</a>
End Rem
Function CameraFogColor(cam:TCamera,r#,g#,b#)
	cam.CameraFogColor(r#,g#,b#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraFogMode.htm">Online Help</a>
End Rem
Function CameraFogMode(cam:TCamera,mode:Int)
	cam.CameraFogMode(mode)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraFogRange.htm">Online Help</a>
End Rem
Function CameraFogRange(cam:TCamera,near#,far#)
	cam.CameraFogRange(near#,far#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraPick.htm">Online Help</a>
End Rem
Function CameraPick:TEntity(cam:TCamera,x#,y#)
	Return TPick.CameraPick(cam,x#,y#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraProject.htm">Online Help</a>
End Rem
Function CameraProject(cam:TCamera,x#,y#,z#)
	cam.CameraProject(x#,y#,z#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraProjMode.htm">Online Help</a>
End Rem
Function CameraProjMode(cam:TCamera,mode:Int)
	cam.CameraProjMode(mode)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraRange.htm">Online Help</a>
End Rem
Function CameraRange(cam:TCamera,near#,far#)
	cam.CameraRange(near#,far#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraViewport.htm">Online Help</a>
End Rem
Function CameraViewport(cam:TCamera,x:Int,y:Int,width:Int,height:Int)
	cam.CameraViewport(x,y,width,height)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CameraZoom.htm">Online Help</a>
End Rem
Function CameraZoom(cam:TCamera,zoom#)
	cam.CameraZoom(zoom#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ClearCollisions.htm">Online Help</a>
End Rem
Function ClearCollisions()
	TGlobal.ClearCollisions()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ClearSurface.htm">Online Help</a>
End Rem
Function ClearSurface(surf:TSurface,clear_verts:Int=True,clear_tris:Int=True)
	surf.ClearSurface(clear_verts,clear_tris)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ClearTextureFilters.htm">Online Help</a>
End Rem
Function ClearTextureFilters()
	TTexture.ClearTextureFilters()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ClearWorld.htm">Online Help</a>
End Rem
Function ClearWorld(entities:Int=True,brushes:Int=True,textures:Int=True)
	TGlobal.ClearWorld(entities,brushes,textures)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionEntity.htm">Online Help</a>
End Rem
Function CollisionEntity:TEntity(ent:TEntity,index:Int)
	Return ent.CollisionEntity(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/Collisions.htm">Online Help</a>
End Rem
Function Collisions(src_no:Int,dest_no:Int,method_no:Int,response_no:Int=0)
	TGlobal.Collisions(src_no,dest_no,method_no,response_no)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionNX.htm">Online Help</a>
End Rem
Function CollisionNX#(ent:TEntity,index:Int)
	Return ent.CollisionNX#(index)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionNY.htm">Online Help</a>
End Rem
Function CollisionNY#(ent:TEntity,index:Int)
	Return ent.CollisionNY#(index)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionNZ.htm">Online Help</a>
End Rem
Function CollisionNZ#(ent:TEntity,index:Int)
	Return ent.CollisionNZ#(index)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionSurface.htm">Online Help</a>
End Rem
Function CollisionSurface:TSurface(ent:TEntity,index:Int)
	Return ent.CollisionSurface(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionTime.htm">Online Help</a>
End Rem
Function CollisionTime#(ent:TEntity,index:Int)
	Return ent.CollisionTime#(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionTriangle.htm">Online Help</a>
End Rem	
Function CollisionTriangle:Int(ent:TEntity,index:Int)
	Return ent.CollisionTriangle(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionX.htm">Online Help</a>
End Rem
Function CollisionX#(ent:TEntity,index:Int)
	Return ent.CollisionX#(index)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionY.htm">Online Help</a>
End Rem
Function CollisionY#(ent:TEntity,index:Int)
	Return ent.CollisionY#(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CollisionZ.htm">Online Help</a>
End Rem
Function CollisionZ#(ent:TEntity,index:Int)
	Return ent.CollisionZ#(index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CountChildren.htm">Online Help</a>
End Rem
Function CountChildren:Int(ent:TEntity)
	Return ent.CountChildren()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CountCollisions.htm">Online Help</a>
End Rem
Function CountCollisions:Int(ent:TEntity)
	Return ent.CountCollisions()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CopyEntity.htm">Online Help</a>
End Rem
Function CopyEntity:TEntity(ent:TEntity,parent:TEntity=Null)
	Return ent.CopyEntity(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CopyMesh.htm">Online Help</a>
End Rem
Function CopyMesh:TMesh(mesh:TMesh,parent:TEntity=Null)
	Return mesh.CopyMesh(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CountSurfaces.htm">Online Help</a>
End Rem
Function CountSurfaces:Int(mesh:TMesh)
	Return mesh.CountSurfaces()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CountTriangles.htm">Online Help</a>
End Rem
Function CountTriangles:Int(surf:TSurface)
	Return surf.CountTriangles()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CountVertices.htm">Online Help</a>
End Rem
Function CountVertices:Int(surf:TSurface)
	Return surf.CountVertices()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateBrush.htm">Online Help</a>
End Rem
Function CreateBrush:TBrush(r#=255.0,g#=255.0,b#=255.0)
	Return TBrush.CreateBrush(r#,g#,b#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateCamera.htm">Online Help</a>
End Rem
Function CreateCamera:TCamera(parent:TEntity=Null)
	Return TCamera.CreateCamera(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateCone.htm">Online Help</a>
End Rem
Function CreateCone:TMesh(segments:Int=8,solid:Int=True,parent:TEntity=Null)
	Return TMesh.CreateCone(segments,solid,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateCylinder.htm">Online Help</a>
End Rem
Function CreateCylinder:TMesh(segments:Int=8,solid:Int=True,parent:TEntity=Null)
	Return TMesh.CreateCylinder(segments,solid,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateCube.htm">Online Help</a>
End Rem
Function CreateCube:TMesh(parent:TEntity=Null)
	Return TMesh.CreateCube(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateMesh.htm">Online Help</a>
End Rem
Function CreateMesh:TMesh(parent:TEntity=Null)
	Return TMesh.CreateMesh(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateLight.htm">Online Help</a>
End Rem
Function CreateLight:TLight(light_type:Int=1,parent:TEntity=Null)
	Return TLight.CreateLight(light_type,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreatePivot.htm">Online Help</a>
End Rem
Function CreatePivot:TPivot(parent:TEntity=Null)
	Return TPivot.CreatePivot(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateSphere.htm">Online Help</a>
End Rem
Function CreateSphere:TMesh(segments:Int=8,parent:TEntity=Null)
	Return TMesh.CreateSphere(segments,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateSprite.htm">Online Help</a>
End Rem
' Sprite
Function CreateSprite:TSprite(parent:TEntity=Null)
	Return TSprite.CreateSprite(parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateSurface.htm">Online Help</a>
End Rem
Function CreateSurface:TSurface(mesh:TMesh,brush:TBrush=Null)
	Return mesh.CreateSurface(brush)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/CreateTexture.htm">Online Help</a>
End Rem
Function CreateTexture:TTexture(width:Int,height:Int,flags:Int=1,frames:Int=1)
	Return TTexture.CreateTexture(width,height,flags,frames)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/DeltaPitch.htm">Online Help</a>
End Rem
Function DeltaPitch#(ent1:TEntity,ent2:TEntity)
	Return ent1.DeltaPitch#(ent2:TEntity)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/DeltaYaw.htm">Online Help</a>
End Rem
Function DeltaYaw#(ent1:TEntity,ent2:TEntity)
	Return ent1.DeltaYaw#(ent2:TEntity)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityAlpha.htm">Online Help</a>
End Rem
Function EntityAlpha(ent:TEntity,alpha#)
	ent.EntityAlpha(alpha#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityAutoFade.htm">Online Help</a>
End Rem
Function EntityAutoFade(ent:TEntity,near#,far#)
	ent.EntityAutoFade(near#,far#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityBlend.htm">Online Help</a>
End Rem
Function EntityBlend(ent:TEntity,blend:Int)
	ent.EntityBlend(blend)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityBox.htm">Online Help</a>
End Rem
Function EntityBox(ent:TEntity,x#,y#,z#,w#,h#,d#)
	ent.EntityBox(x#,y#,z#,w#,h#,d#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityClass.htm">Online Help</a>
End Rem
Function EntityClass$(ent:TEntity)
	Return ent.EntityClass$()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityCollided.htm">Online Help</a>
End Rem
Function EntityCollided:TEntity(ent:TEntity,type_no:Int)
	Return ent.EntityCollided(type_no)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityColor.htm">Online Help</a>
End Rem
Function EntityColor(ent:TEntity,red#,green#,blue#)
	ent.EntityColor(red#,green#,blue#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityDistance.htm">Online Help</a>
End Rem
Function EntityDistance#(ent1:TEntity,ent2:TEntity)
	Return ent1.EntityDistance#(ent2)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityFX.htm">Online Help</a>
End Rem
Function EntityFX(ent:TEntity,fx:Int)
	ent.EntityFX(fx)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityInView.htm">Online Help</a>
End Rem
Function EntityInView:Int(ent:TEntity,cam:TCamera)
	Return cam.EntityInView(ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityName.htm">Online Help</a>
End Rem
Function EntityName$(ent:TEntity)
	Return ent.EntityName$()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityOrder.htm">Online Help</a>
End Rem
Function EntityOrder(ent:TEntity,order:Int)
	ent.EntityOrder(order)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityParent.htm">Online Help</a>
End Rem
Function EntityParent(ent:TEntity,parent_ent:TEntity,glob:Int=True)
	ent.EntityParent(parent_ent,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityPick.htm">Online Help</a>
End Rem
Function EntityPick:TEntity(ent:TEntity,range#)
	Return TPick.EntityPick(ent,range#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityPickMode.htm">Online Help</a>
End Rem
Function EntityPickMode(ent:TEntity,pick_mode:Int,obscurer:Int=True)
	ent.EntityPickMode(pick_mode,obscurer)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityPitch.htm">Online Help</a>
End Rem
Function EntityPitch#(ent:TEntity,glob:Int=False)
	Return ent.EntityPitch#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityRadius.htm">Online Help</a>
End Rem
Function EntityRadius(ent:TEntity,radius_x#,radius_y#=0.0)
	ent.EntityRadius(radius_x#,radius_y#)
End Function
	
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityRoll.htm">Online Help</a>
End Rem
Function EntityRoll#(ent:TEntity,glob:Int=False)
	Return ent.EntityRoll#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityShininess.htm">Online Help</a>
End Rem
Function EntityShininess(ent:TEntity,shine#)
	ent.EntityShininess(shine#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityTexture.htm">Online Help</a>
End Rem
Function EntityTexture(ent:TEntity,tex:TTexture,frame:Int=0,index:Int=0)
	TMesh(ent).EntityTexture(tex:TTexture,frame,index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityType.htm">Online Help</a>
End Rem
Function EntityType(ent:TEntity,type_no:Int,recursive:Int=False)
	ent.EntityType(type_no,recursive)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityVisible.htm">Online Help</a>
End Rem
Function EntityVisible:Int(src_ent:TEntity,dest_ent:TEntity)
	Return TPick.EntityVisible(src_ent,dest_ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityX.htm">Online Help</a>
End Rem
Function EntityX#(ent:TEntity,glob:Int=False)
	Return ent.EntityX#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityY.htm">Online Help</a>
End Rem
Function EntityY#(ent:TEntity,glob:Int=False)
	Return ent.EntityY#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityYaw.htm">Online Help</a>
End Rem
Function EntityYaw#(ent:TEntity,glob:Int=False)
	Return ent.EntityYaw#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/EntityZ.htm">Online Help</a>
End Rem
Function EntityZ#(ent:TEntity,glob:Int=False)
	Return ent.EntityZ#(glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ExtractAnimSeq.htm">Online Help</a>
End Rem
Function ExtractAnimSeq:Int(ent:TEntity,first_frame:Int,last_frame:Int,seq:Int=0)
	Return ent.ExtractAnimSeq(first_frame,last_frame,seq)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FindChild.htm">Online Help</a>
End Rem
Function FindChild:TEntity(ent:TEntity,child_name$)
	Return ent.FindChild(child_name$)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FindSurface.htm">Online Help</a>
End Rem
Function FindSurface:TSurface(mesh:TMesh,brush:TBrush)
	Return mesh.FindSurface(brush)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FitMesh.htm">Online Help</a><p>
End Rem
Function FitMesh:TMesh(mesh:TMesh,x#,y#,z#,width#,height#,depth#,uniform:Int=False)
	mesh.FitMesh(x#,y#,z#,width#,height#,depth#,uniform)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FlipMesh.htm">Online Help</a>
End Rem
Function FlipMesh:TMesh(mesh:TMesh)
	mesh.FlipMesh()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FreeBrush.htm">Online Help</a>
End Rem
Function FreeBrush(brush:TBrush)
	brush.FreeBrush()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FreeEntity.htm">Online Help</a>
End Rem
Function FreeEntity(ent:TEntity)
	ent.FreeEntity()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/FreeTexture.htm">Online Help</a>
End Rem
Function FreeTexture:TTexture(tex:TTexture)
	tex.FreeTexture()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetBrushTexture.htm">Online Help</a>
End Rem
Function GetBrushTexture:TTexture(brush:TBrush,index:Int=0)
	Return TTexture.GetBrushTexture(brush,index)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetChild.htm">Online Help</a>
End Rem
Function GetChild:TEntity(ent:TEntity,child_no:Int)
	Return ent.GetChild(child_no)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetEntityBrush.htm">Online Help</a>
End Rem
Function GetEntityBrush:TBrush(ent:TEntity)
	TBrush.GetEntityBrush(ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetEntityType.htm">Online Help</a>
End Rem	
Function GetEntityType:Int(ent:TEntity)
	Return ent.GetEntityType()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ResetEntity.htm">Online Help</a>
End Rem
Function GetMatElement#(ent:TEntity,row:Int,col:Int)
	ent.GetMatElement#(row,col)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetParent.htm">Online Help</a>
End Rem
Function GetParent:TEntity(ent:TEntity)
	Return ent.GetParent()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetSurface.htm">Online Help</a>
End Rem
Function GetSurface:TSurface(mesh:TMesh,surf_no:Int)
	Return mesh.GetSurface(surf_no)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/GetSurfaceBrush.htm">Online Help</a>
End Rem
Function GetSurfaceBrush:TBrush(surf:TSurface)
	Return TBrush.GetSurfaceBrush(surf)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/Graphics3D.htm">Online Help</a>
End Rem
Function Graphics3D(width:Int,height:Int,depth:Int=0,mode:Int=0,rate:Int=60,flags:Int=-1) 'SMALLFIXES added flags
	TGlobal.Graphics3D(width,height,depth,mode,rate,flags)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/HandleSprite.htm">Online Help</a>
End Rem	
Function HandleSprite(sprite:TSprite,h_x#,h_y#)
	sprite.HandleSprite(h_x#,h_y#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/HideEntity.htm">Online Help</a>
End Rem
Function HideEntity(ent:TEntity)
	ent.HideEntity()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LightColor.htm">Online Help</a>
End Rem
Function LightColor(light:TLight,red#,green#,blue#)
	light.LightColor(red#,green#,blue#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LightConeAngles.htm">Online Help</a>
End Rem
Function LightConeAngles(light:TLight,inner_ang#,outer_ang#)
	light.LightConeAngles(inner_ang#,outer_ang#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LightRange.htm">Online Help</a>
End Rem
Function LightRange(light:TLight,range#)
	light.LightRange(range#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LinePick.htm">Online Help</a>
End Rem
Function LinePick:TEntity(x#,y#,z#,dx#,dy#,dz#,radius#=0.0)
	Return TPick.LinePick(x#,y#,z#,dx#,dy#,dz#,radius#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadAnimMesh.htm">Online Help</a>
End Rem
Function LoadAnimMesh:TMesh(file$,parent:TEntity=Null)
	Return TMesh.LoadAnimMesh(file$,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadAnimTexture.htm">Online Help</a>
End Rem
Function LoadAnimTexture:TTexture(file$,flags:Int,frame_width:Int,frame_height:Int,first_frame:Int,frame_count:Int)
	Return TTexture.LoadAnimTexture(file$,flags,frame_width,frame_height,first_frame,frame_count)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadBrush.htm">Online Help</a>
End Rem
Function LoadBrush:TBrush(file$,flags:Int=1,u_scale#=1.0,v_scale#=1.0)
	Return TBrush.LoadBrush(file$,flags,u_scale#,v_scale#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadMesh.htm">Online Help</a>
End Rem
Function LoadMesh:TMesh(file$,parent:TEntity=Null)
	Return TMesh.LoadMesh(file$,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadTexture.htm">Online Help</a>
End Rem
Function LoadTexture:TTexture(file$,flags:Int=1)
	Return TTexture.LoadTexture(file$,flags)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/LoadSprite.htm">Online Help</a>
End Rem
Function LoadSprite:TSprite(tex_file$,tex_flag:Int=1,parent:TEntity=Null)
	Return TSprite.LoadSprite(tex_file$,tex_flag,parent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/MeshDepth.htm">Online Help</a>
End Rem
Function MeshDepth#(mesh:TMesh)
	Return mesh.MeshDepth#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/MeshHeight.htm">Online Help</a>
End Rem
Function MeshHeight#(mesh:TMesh)
	Return mesh.MeshHeight#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/MeshWidth.htm">Online Help</a>
End Rem
Function MeshWidth#(mesh:TMesh)
	Return mesh.MeshWidth#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/MoveEntity.htm">Online Help</a>
End Rem
Function MoveEntity(ent:TEntity,x#,y#,z#)
	ent.MoveEntity(x#,y#,z#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/NameEntity.htm">Online Help</a>
End Rem
Function NameEntity(ent:TEntity,name$)
	ent.NameEntity(name$)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PaintEntity.htm">Online Help</a>
End Rem
Function PaintEntity(ent:TEntity,brush:TBrush)
	TMesh(ent).PaintEntity(brush)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PaintMesh.htm">Online Help</a>
End Rem
Function PaintMesh:TMesh(mesh:TMesh,brush:TBrush)
	mesh.PaintMesh(brush)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PaintSurface.htm">Online Help</a>
End Rem
Function PaintSurface:Int(surf:TSurface,brush:TBrush)
	Return surf.PaintSurface(brush)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedEntity.htm">Online Help</a>
End Rem
Function PickedEntity:TEntity()
	Return TPick.PickedEntity:TEntity()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedNX.htm">Online Help</a>
End Rem
Function PickedNX#()
	Return TPick.PickedNX#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedNY.htm">Online Help</a>
End Rem
Function PickedNY#()
	Return TPick.PickedNY#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedNZ.htm">Online Help</a>
End Rem
Function PickedNZ#()
	Return TPick.PickedNZ#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedSurface.htm">Online Help</a>
End Rem
Function PickedSurface:TSurface()
	Return TPick.PickedSurface:TSurface()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedTime.htm">Online Help</a>
End Rem
Function PickedTime#()
	Return TPick.PickedTime#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedTriangle.htm">Online Help</a>
End Rem
Function PickedTriangle:Int()
	Return TPick.PickedTriangle()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedX.htm">Online Help</a>
End Rem
Function PickedX#()
	Return TPick.PickedX#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedY.htm">Online Help</a>
End Rem
Function PickedY#()
	Return TPick.PickedY#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PickedZ.htm">Online Help</a>
End Rem
Function PickedZ#()
	Return TPick.PickedZ#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PointEntity.htm">Online Help</a>
End Rem
Function PointEntity(ent:TEntity,target_ent:TEntity,roll#=0)
	ent.PointEntity(target_ent,roll#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PositionEntity.htm">Online Help</a>
End Rem
Function PositionEntity(ent:TEntity,x#,y#,z#,glob:Int=False)
	ent.PositionEntity(x#,y#,z#,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PositionMesh.htm">Online Help</a>
End Rem
Function PositionMesh:TMesh(mesh:TMesh,px#,py#,pz#)
	mesh.PositionMesh(px#,py#,pz#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/PositionTexture.htm">Online Help</a>
End Rem
Function PositionTexture(tex:TTexture,u_pos#,v_pos#)
	tex.PositionTexture(u_pos#,v_pos#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ProjectedX.htm">Online Help</a>
End Rem
Function ProjectedX#()
    Return TCamera.projected_x#
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ProjectedY.htm">Online Help</a>
End Rem
Function ProjectedY#()
    Return TCamera.projected_y#
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ProjectedZ.htm">Online Help</a>
End Rem
Function ProjectedZ#()
    Return TCamera.projected_z#
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/RenderWorld.htm">Online Help</a>
End Rem
Function RenderWorld()
	TGlobal.RenderWorld()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ResetEntity.htm">Online Help</a>
End Rem
Function ResetEntity(ent:TEntity)
	ent.ResetEntity()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/RotateEntity.htm">Online Help</a>
End Rem
Function RotateEntity(ent:TEntity,x#,y#,z#,glob:Int=False)
	ent.RotateEntity(x#,y#,z#,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/RotateMesh.htm">Online Help</a>
End Rem
Function RotateMesh:TMesh(mesh:TMesh,pitch#,yaw#,roll#)
	mesh.RotateMesh(pitch#,yaw#,roll#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/RotateSprite.htm">Online Help</a>
End Rem
Function RotateSprite(sprite:TSprite,ang#)
	sprite.RotateSprite(ang#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/RotateTexture.htm">Online Help</a>
End Rem	
Function RotateTexture(tex:TTexture,ang#)
	tex.RotateTexture(ang#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ScaleEntity.htm">Online Help</a>
End Rem
Function ScaleEntity(ent:TEntity,x#,y#,z#,glob:Int=False)
	ent.ScaleEntity(x#,y#,z#,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ScaleMesh.htm">Online Help</a>
End Rem
Function ScaleMesh:TMesh(mesh:TMesh,sx#,sy#,sz#)
	mesh.ScaleMesh(sx#,sy#,sz#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ScaleSprite.htm">Online Help</a>
End Rem	
Function ScaleSprite(sprite:TSprite,s_x#,s_y#)
	sprite.ScaleSprite(s_x#,s_y#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ScaleTexture.htm">Online Help</a>
End Rem
Function ScaleTexture(tex:TTexture,u_scale#,v_scale#)	
	tex.ScaleTexture(u_scale#,v_scale#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/SetAnimTime.htm">Online Help</a>
End Rem
Function SetAnimTime(ent:TEntity,time#,seq:Int=0)
	ent.SetAnimTime(time#,seq)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/SetCubeFace.htm">Online Help</a>
End Rem
Function SetCubeFace(tex:TTexture,face:Int)
	tex.SetCubeFace(face)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/SetCubeMode.htm">Online Help</a>
End Rem
Function SetCubeMode(tex:TTexture,mode:Int)
	tex.SetCubeMode(mode)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/ShowEntity.htm">Online Help</a>
End Rem
Function ShowEntity(ent:TEntity)
	ent.ShowEntity()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/SpriteViewMode.htm">Online Help</a>
End Rem	
Function SpriteViewMode(sprite:TSprite,mode:Int)
	sprite.SpriteViewMode(mode)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureBlend.htm">Online Help</a>
End Rem
Function TextureBlend(tex:TTexture,blend:Int)
	tex.TextureBlend(blend)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureCoords.htm">Online Help</a>
End Rem
Function TextureCoords(tex:TTexture,coords:Int)
	tex.TextureCoords(coords)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureHeight.htm">Online Help</a>
End Rem	
Function TextureHeight:Int(tex:TTexture)
	Return tex.TextureHeight()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureFilter.htm">Online Help</a>
End Rem
Function TextureFilter(match_text$,flags:Int)
	TTexture.TextureFilter(match_text$,flags)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureName.htm">Online Help</a>
End Rem	
Function TextureName$(tex:TTexture)
	Return tex.TextureName$()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TextureWidth.htm">Online Help</a>
End Rem	
Function TextureWidth:Int(tex:TTexture)
	Return tex.TextureWidth()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormedX.htm">Online Help</a>
End Rem
Function TFormedX#()
	Return TEntity.TFormedX#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormedY.htm">Online Help</a>
End Rem
Function TFormedY#()
	Return TEntity.TFormedY#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormedZ.htm">Online Help</a>
End Rem
Function TFormedZ#()
	Return TEntity.TFormedZ#()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormNormal.htm">Online Help</a>
End Rem
Function TFormNormal(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	TEntity.TFormNormal(x#,y#,z#,src_ent,dest_ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormPoint.htm">Online Help</a>
End Rem
Function TFormPoint(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	TEntity.TFormPoint(x#,y#,z#,src_ent,dest_ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TFormVector.htm">Online Help</a>
End Rem
Function TFormVector(x#,y#,z#,src_ent:TEntity,dest_ent:TEntity)
	TEntity.TFormVector(x#,y#,z#,src_ent,dest_ent)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TranslateEntity.htm">Online Help</a>
End Rem
Function TranslateEntity(ent:TEntity,x#,y#,z#,glob:Int=False)
	ent.TranslateEntity(x#,y#,z#,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TriangleVertex.htm">Online Help</a>
End Rem
Function TriangleVertex:Int(surf:TSurface,tri_no:Int,corner:Int)
	Return surf.TriangleVertex(tri_no,corner)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/TurnEntity.htm">Online Help</a>
End Rem
Function TurnEntity(ent:TEntity,x#,y#,z#,glob:Int=False)
	ent.TurnEntity(x#,y#,z#,glob)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/UpdateNormals.htm">Online Help</a>
End Rem
Function UpdateNormals(mesh:TMesh)
	mesh.UpdateNormals()
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/UpdateWorld.htm">Online Help</a>
End Rem
Function UpdateWorld(anim_speed#=1.0)
	TGlobal.UpdateWorld(anim_speed#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VectorPitch.htm">Online Help</a>
End Rem	
Function VectorPitch#(vx#,vy#,vz#)
	Return TVector.VectorPitch#(vx#,vy#,vz#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VectorYaw.htm">Online Help</a>
End Rem	
Function VectorYaw#(vx#,vy#,vz#)
	Return TVector.VectorYaw#(vx#,vy#,vz#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexAlpha.htm">Online Help</a>
End Rem
Function VertexAlpha#(surf:TSurface,vid:Int)
	Return surf.VertexAlpha#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexBlue.htm">Online Help</a>
End Rem
Function VertexBlue#(surf:TSurface,vid:Int)
	Return surf.VertexBlue#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexColor.htm">Online Help</a>
End Rem
Function VertexColor:Int(surf:TSurface,vid:Int,r#,g#,b#,a#=1.0)
	Return surf.VertexColor(vid,r#,g#,b#,a#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexCoords.htm">Online Help</a>
End Rem
Function VertexCoords:Int(surf:TSurface,vid:Int,x#,y#,z#)
	Return surf.VertexCoords(vid,x#,y#,z#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexGreen.htm">Online Help</a>
End Rem
Function VertexGreen#(surf:TSurface,vid:Int)
	Return surf.VertexGreen#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexNormal.htm">Online Help</a>
End Rem
Function VertexNormal:Int(surf:TSurface,vid:Int,nx#,ny#,nz#)
	Return surf.VertexNormal(vid,nx#,ny#,nz#)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexNX.htm">Online Help</a>
End Rem
Function VertexNX#(surf:TSurface,vid:Int)
	Return surf.VertexNX#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexNY.htm">Online Help</a>
End Rem
Function VertexNY#(surf:TSurface,vid:Int)
	Return surf.VertexNY#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexNZ.htm">Online Help</a>
End Rem
Function VertexNZ#(surf:TSurface,vid:Int)
	Return surf.VertexNZ#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexRed.htm">Online Help</a>
End Rem
Function VertexRed#(surf:TSurface,vid:Int)
	Return surf.VertexRed#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexTexCoords.htm">Online Help</a>
End Rem
Function VertexTexCoords:int(surf:TSurface,vid:Int,u#,v#,w#=0.0,coord_set:Int=0)
	Return surf.VertexTexCoords(vid,u#,v#,w#,coord_set)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexU.htm">Online Help</a>
End Rem
Function VertexU#(surf:TSurface,vid:Int,coord_set:Int=0)
	Return surf.VertexU#(vid,coord_set)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexV.htm">Online Help</a>
End Rem
Function VertexV#(surf:TSurface,vid:Int,coord_set:Int=0)
	Return surf.VertexV#(vid,coord_set)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexW.htm">Online Help</a>
End Rem
Function VertexW#(surf:TSurface,vid:Int,coord_set:Int=0)
	Return surf.VertexW#(vid,coord_set)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexX.htm">Online Help</a>
End Rem
Function VertexX#(surf:TSurface,vid:Int)
	Return surf.VertexX#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexY.htm">Online Help</a>
End Rem
Function VertexY#(surf:TSurface,vid:Int)
	Return surf.VertexY#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/VertexZ.htm">Online Help</a>
End Rem
Function VertexZ#(surf:TSurface,vid:Int)
	Return surf.VertexZ#(vid)
End Function

Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/Wireframe.htm">Online Help</a>
End Rem
Function Wireframe(enable:Int)
	TGlobal.Wireframe(enable)
End Function

' Blitz2D

Function Text(x:Int,y:Int,str$)
	TBlitz2D.Text(x,y,str$)
End Function

Function BeginMax2D()
	TBlitz2D.BeginMax2D()
End Function

Function EndMax2D()
	TBlitz2D.EndMax2D()
End Function

' ***extras***

Function EntityScaleX:Float(ent:TEntity,glob:Int=False)
	Return ent.EntityScaleX:Float(glob)
End Function

Function EntityScaleY:Float(ent:TEntity,glob:Int=False)
	Return ent.EntityScaleY:Float(glob)
End Function

Function EntityScaleZ:Float(ent:TEntity,glob:Int=False)
	Return ent.EntityScaleZ:Float(glob)
End Function

' ***todo***

Function LightMesh(mesh:TMesh,red#,green#,blue#,range#=0,light_x#=0,light_y#=0,light_z#=0)
End Function
Function MeshesIntersect(mesh1:TMesh,mesh2:TMesh)
End Function
Function CreatePlane(sub_divs:Int=1,parent:TEntity=Null)
End Function
Function LoadAnimSeq(ent:TEntity,filename$)
End Function
Function SetAnimKey(ent:TEntity,frame:Int,pos_key:Int=True,rot_key:Int=True,scale_key:Int=True)
End Function
Function AddAnimSeq(ent:TEntity,length:Int)
End Function

'MiniB3D-NG functions
'AlignToVector by Warner
Rem
bbdoc: <a href="https://kippykip.com/b3ddocs/commands/3d_commands/AlignToVector.htm">Online Help</a>
End Rem
Function AlignToVector(ent:TEntity, x:Float, y:Float, z:Float, TMP_unused:Int=1) 
	'TMP_unused is a stub, incase old BB projects need it
 
	'order=yaw-pitch-roll
   
	Local yaw#,pitch#,roll#
	Local x1#,y1#,z1#
	Local x2#,y2#,z2#
	Local x3#,y3#,z3#
   
	yaw# = -ATan2(x, z)
   
	x1# = z*Sin(yaw) + x*Cos(yaw)
	y1# = y
	z1# = z*Cos(yaw) - x*Sin(yaw)
   
	pitch# = -ATan2(y1, z1)
	x2# = x1
	y2# = y1*Cos(pitch) - z1*Sin(pitch)
	z2# = y1*Sin(pitch) + z1*Cos(pitch)
   
	roll# = -ATan2(x2, y2)
	x3# = x2*Cos(roll) - y2*Sin(roll)
	y3# = x2*Sin(roll) + y2*Cos(roll)
	z3# = z2

	'FIX - might turn out it should be If y <= 0 .. haven't tested it thoroughly enough
	If y < 0 roll :+ 180
   
	RotateEntity ent, pitch, yaw, roll
       
End Function

Rem
bbdoc: Minib3d-NG Only
about:
This command is required for when moving bones with FindChild and GetChild.

After setting positions / rotation of the bones, you will have to run this function after all the changes.
Also has to be used after UpdateWorld otherwise the positions will reset.

It should also be noted that it moves the bones relative to the parent bone/entity. And not from the worlds proper X Y Z coordinates.
End Rem
Function UpdateBones(ent:TEntity) 
	If TMesh(ent) <> Null
		Local start_frame:Int = TMesh(ent).anim_seqs_first[TMesh(ent).anim_seq] 
		Local end_frame:Int = TMesh(ent).anim_seqs_last[TMesh(ent).anim_seq] 
		Local framef:Float = TMesh(ent).AnimTime
		
		If TMesh(ent).anim = False Then Return ' mesh contains no anim data

		TMesh(ent).anim_render=True

		' cap framef values
		If framef>end_frame Then framef=end_frame
		If framef<start_frame Then framef=start_frame
		
		For Local bent:TBone=EachIn TMesh(ent).bones
		
			
			'Used to convert Pitch Yaw and Roll to whatever a Quat is. I'm not mathematician		
			Local QuadPYR:TQuaternion = TQuaternion.EulerToQuat:TQuaternion(bent.rx, bent.ry, bent.rz) 
	
			Local px3:Float=0
			Local py3:Float=0
			Local pz3:Float=0

			' interpolate keys

			Local w3:Float=0
			Local x3:Float=0
			Local y3:Float=0
			Local z3:Float=0

			'Forcefully override this! With the current position and rotation values!
			'So this should readjust the positions using "PositionEntity" and "RotateEntity".
			w3 = -QuadPYR.w
			x3 = QuadPYR.x
			y3 = QuadPYR.y
			z3 = QuadPYR.z
			
			px3 = TBone(bent).px
			py3 = TBone(bent).py
			pz3 = TBone(bent).pz
			
	
			TQuaternion.QuatToMat(w3, x3, y3, z3, TBone(bent).mat) 

			TBone(bent).mat.grid[3, 0] = px3
			TBone(bent).mat.grid[3, 1] = py3
			TBone(bent).mat.grid[3, 2] = pz3
			
			' set mat2 to equal mat
			TBone(bent).mat2.Overwrite(TBone(bent).mat)
			
			' set mat - includes root parent transformation
			' mat is used for store global bone positions, needed when displaying actual bone positions and attaching entities to bones
			If TBone(bent).parent<>Null
				Local new_mat:TMatrix=TBone(bent).parent.mat.Copy()
				new_mat.Multiply(TBone(bent).mat) 
				TBone(bent).mat.Overwrite(new_mat)
			EndIf
			
			' set mat2 - does not include root parent transformation
			' mat2 is used to store local bone positions, and is needed for vertex deform
			If TBone(TBone(bent).parent)<>Null
				Local new_mat:TMatrix=TBone(TBone(bent).parent).mat2.Copy()
				new_mat.Multiply(TBone(bent).mat2) 
				TBone(bent).mat2.Overwrite(new_mat)
			EndIf

			' set tform mat
			' A tform mat is needed to transform vertices, and is basically the bone mat multiplied by the inverse reference pose mat
			TBone(bent).tform_mat.Overwrite(TBone(bent).mat2)
			TBone(bent).tform_mat.Multiply(TBone(bent).inv_mat)

			' update bone children
			If TBone(bent).child_list.IsEmpty() <> True Then TEntity.UpdateChildren(bent) 
							
		Next
							
		' --- vertex deform ---
		TAnimation.VertexDeform(TMesh(ent))
	
	EndIf
		
End Function

Rem
bbdoc: Minib3d-NG/OpenB3D Only
about:
Backported function from OpenB3D
Moves entity to the given x y z position at the speed of rate.
End Rem
Function ActMoveTo(TMP_Entity:TEntity, TMP_X:Float, TMP_Y:Float, TMP_Z:Float, TMP_Rate:Float) 
	Local dx:Float = TMP_X:Float - EntityX(TMP_Entity:TEntity) 
	Local dy:Float = TMP_Y:Float - EntityY(TMP_Entity:TEntity) 
	Local dz:Float = TMP_Z:Float - EntityZ(TMP_Entity:TEntity) 
	Local n:Float = Sqr(dx:Float * dx:Float + dy:Float * dy:Float + dz:Float * dz:Float) 
	
	If (n:Float < TMP_Rate:Float) 
		Return True
	EndIf
	
	TranslateEntity(TMP_Entity:TEntity, dx:Float / n:Float * TMP_Rate:Float, dy:Float / n:Float * TMP_Rate:Float, dz:Float / n:Float * TMP_Rate:Float) 
	Return False
End Function

Rem
bbdoc: Minib3d-NG/OpenB3D Only
about:
Backported function from OpenB3D
Turns entity to the given Pitch Yaw Roll rotation at the speed of rate.
End Rem
Function ActTurnTo(TMP_Entity:TEntity, TMP_Pitch:Float, TMP_Yaw:Float, TMP_Roll:Float, TMP_Rate:Float) 
	Local dx:Float = TMP_Pitch:Float - EntityPitch(TMP_Entity:TEntity) 
	Local dy:Float = TMP_Yaw:Float - EntityYaw(TMP_Entity:TEntity) 
	Local dz:Float = TMP_Roll:Float - EntityRoll(TMP_Entity:TEntity) 
	Local n:Float = Abs(dx) + Abs(dy) + Abs(dz) 
	
	If (n:Float < TMP_Rate:Float) 
		Return True
	EndIf
	
	Local p:Float = dx / n * TMP_Rate + EntityPitch(TMP_Entity:TEntity) 
	Local y:Float = dy / n * TMP_Rate + EntityYaw(TMP_Entity:TEntity) 
	Local r:Float = dz / n * TMP_Rate + EntityRoll(TMP_Entity:TEntity) 
	RotateEntity(TMP_Entity:TEntity, p, y, r) 
	Return False
End Function

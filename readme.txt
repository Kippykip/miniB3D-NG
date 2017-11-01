MiniB3D-NG V1.00 based on MiniB3D V0.54 by Simon Harrison (si@si-design.co.uk)
----------------------------------------------------

Version History
---------------

v1.00 - Added UpdateBones function - Run after positioning/rotating Bones with FindChild/GetChild to manipulate them! Be sure to run after UpdateWorld. Also positioning is relative to the parent bone unlike Blitz3D.
v1.00 - Backported ActMoveTo and ActTurnTo from OpenB3D.
V1.00 - Texture Flag 256 is now a Nearest Neighbour filter. In Blitz3D only it's normally for loading to VRAM.
V1.00 - Primitive 3DS support by Silver_Knee.
V1.00 - AlignToVector is no longer a stub, thanks Warner.
V1.00 - SmallFix so Models with a corrupted Brush Count doesn't make a array overflow.
V1.00 - Documentation links for Blitz3D commands now point to a mirror.

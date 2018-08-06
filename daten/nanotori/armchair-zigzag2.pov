// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/armchair-zigzag2.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/armchair-zigzag2.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/armchair-zigzag2.pov.tga +P +X +A +FT +C
#if (version < 3.5) 
#error "VMD POV3DisplayDevice has been compiled for POV-Ray 3.5 or above.\nPlease upgrade POV-Ray or recompile VMD."
#end 
#declare VMD_clip_on=array[3] {0, 0, 0};
#declare VMD_clip=array[3];
#declare VMD_scaledclip=array[3];
#declare VMD_line_width=0.0020;
#macro VMDC ( C1 )
  texture { pigment { rgbt C1 }}
#end
#macro VMD_point (P1, R1, C1)
  #local T = texture { finish { ambient 1.0 diffuse 0.0 phong 0.0 specular 0.0 } pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_line (P1, P2, C1)
  #local T = texture { finish { ambient 1.0 diffuse 0.0 phong 0.0 specular 0.0 } pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cylinder {P1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cylinder {P1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_sphere (P1, R1, C1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  sphere {P1, R1 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_cylinder (P1, P2, R1, C1, O1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cylinder {P1, P2, R1 #if(O1) open #end texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cylinder {P1, P2, R1 #if(O1) open #end texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_cone (P1, P2, R1, C1)
  #local T = texture { pigment { C1 } }
  #if(VMD_clip_on[2])
  intersection {
    cone {P1, R1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
    VMD_clip[2]
  }
  #else
  cone {P1, R1, P2, VMD_line_width texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
  #end
#end
#macro VMD_triangle (P1, P2, P3, N1, N2, N3, C1)
  #local T = texture { pigment { C1 } }
  smooth_triangle {P1, N1, P2, N2, P3, N3 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
#end
#macro VMD_tricolor (P1, P2, P3, N1, N2, N3, C1, C2, C3)
  #local NX = P2-P1;
  #local NY = P3-P1;
  #local NZ = vcross(NX, NY);
  #local T = texture { pigment {
    average pigment_map {
      [1 gradient x color_map {[0 rgb 0] [1 C2*3]}]
      [1 gradient y color_map {[0 rgb 0] [1 C3*3]}]
      [1 gradient z color_map {[0 rgb 0] [1 C1*3]}]
    }
    matrix <1.01,0,1,0,1.01,1,0,0,1,-.002,-.002,-1>
    matrix <NX.x,NX.y,NX.z,NY.x,NY.y,NY.z,NZ.x,NZ.y,NZ.z,P1.x,P1.y,P1.z>
  } }
  smooth_triangle {P1, N1, P2, N2, P3, N3 texture {T} #if(VMD_clip_on[1]) clipped_by {VMD_clip[1]} #end no_shadow}
#end
camera {
  orthographic
  location <0.0000, 0.0000, -2.0000>
  look_at <0.0000, 0.0000, 2.0000>
  up <0.0000, 3.0000, 0.0000>
  right <5.4494, 0.0000, 0.0000>
}
light_source { 
  <-0.1000, 0.1000, -1.0000> 
  color rgb<1.000, 1.000, 1.000> 
  parallel 
  point_at <0.0, 0.0, 0.0> 
}
light_source { 
  <1.0000, 2.0000, -0.5000> 
  color rgb<1.000, 1.000, 1.000> 
  parallel 
  point_at <0.0, 0.0, 0.0> 
}
background {
  color rgb<1.000, 1.000, 1.000>
}
#default { texture {
 finish { ambient 0.000 diffuse 0.650 phong 0.1 phong_size 40.000 specular 0.500 }
} }
#declare VMD_line_width=0.0020;
// MoleculeID: 3 ReprID: 0 Beginning CPK
// MoleculeID: 3 ReprID: 0 Beginning VDW
VMD_sphere(<0.3864,0.0314,-0.5988>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.6939,0.0135,-0.3707>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.8046,0.3188,-0.1929>,0.1234,rgbt<0.200,0.600,0.890,0.000>)
VMD_sphere(<0.8046,0.3188,0.1929>,0.1234,rgbt<0.200,0.600,0.890,0.000>)
VMD_sphere(<0.6939,0.0135,0.3707>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3864,0.0314,0.5988>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1853,-0.2914,-0.6540>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.1950,-0.2928,-0.6566>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.7651,-0.3100,-0.1899>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.7651,-0.3100,0.1899>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.1950,-0.2928,0.6566>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1853,-0.2914,0.6540>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1686,0.3684,-0.6828>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.2125,0.3668,-0.6451>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3931,0.6908,-0.5386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.6936,0.6595,-0.3083>,0.1234,rgbt<0.200,0.600,0.890,0.000>)
VMD_sphere(<0.7095,0.8869,-0.0000>,0.1234,rgbt<0.200,0.600,0.890,0.000>)
VMD_sphere(<0.6936,0.6595,0.3083>,0.1234,rgbt<0.200,0.600,0.890,0.000>)
VMD_sphere(<0.3931,0.6908,0.5386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.2125,0.3668,0.6451>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1686,0.3684,0.6828>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3653,0.0416,0.6386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7230,0.0473,0.5071>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.8589,-0.2618,0.3186>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<-1.0648,-0.1459,0.0000>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<-0.8589,-0.2618,-0.3186>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<-0.7230,0.0473,-0.5071>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3653,0.0416,-0.6386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7402,0.6910,0.6386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3588,0.6979,0.6828>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1941,-0.9479,0.6295>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3755,-1.2801,0.5794>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.1852,-0.9479,0.6515>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3755,-0.6157,0.5794>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3736,-0.6227,0.6001>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1696,1.0287,0.6451>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3736,-1.2731,0.6001>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.9141,0.3783,0.5071>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.2012,1.0232,0.5386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7017,-1.2919,0.3775>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7017,-0.6039,0.3775>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<0.6717,-0.6280,0.3653>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-1.2498,0.4152,0.3186>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.6717,-1.2679,0.3653>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7816,-0.9479,0.1863>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<0.3244,1.2991,0.3083>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.7572,-0.9479,0.1903>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-1.2523,0.1790,0.0000>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.5292,1.1991,-0.0000>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7816,-0.9479,-0.1863>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<0.7572,-0.9479,-0.1903>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7017,-0.6039,-0.3775>,0.1211,rgbt<0.700,0.200,0.100,0.000>)
VMD_sphere(<0.6717,-0.6280,-0.3653>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-1.2498,0.4152,-0.3186>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.6717,-1.2679,-0.3653>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7017,-1.2919,-0.3775>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3244,1.2991,-0.3083>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3755,-0.6157,-0.5794>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.9141,0.3783,-0.5071>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3736,-0.6227,-0.6001>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3736,-1.2731,-0.6001>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.2012,1.0232,-0.5386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3755,-1.2801,-0.5794>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1941,-0.9479,-0.6295>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.1852,-0.9479,-0.6515>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7402,0.6910,-0.6386>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1696,1.0287,-0.6451>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3588,0.6979,-0.6828>,0.1354,rgbt<0.350,0.350,0.350,0.000>)
VMD_cylinder(<0.386355,0.0313992,-0.598808>,<0.29942,0.199123,-0.621932>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.386355,0.0313992,-0.598808>,<0.54014,0.0224279,-0.484735>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.386355,0.0313992,-0.598808>,<0.290666,-0.130687,-0.627722>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,-0.370662>,<0.54014,0.0224279,-0.484735>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,-0.370662>,<0.729534,-0.148269,-0.280263>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,-0.370662>,<0.749248,0.166138,-0.281764>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.804572,0.31882,-0.192866>,<0.749097,0.489176,-0.250567>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.804572,0.31882,-0.192866>,<0.749248,0.166138,-0.281764>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.804572,0.31882,-0.192866>,<0.804572,0.31882,-1.81585e-016>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.804572,0.31882,0.192866>,<0.749097,0.489176,0.250567>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.804572,0.31882,0.192866>,<0.749248,0.166138,0.281764>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.804572,0.31882,0.192866>,<0.804572,0.31882,-1.81585e-016>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,0.370662>,<0.729534,-0.148269,0.280263>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,0.370662>,<0.54014,0.0224279,0.484735>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693925,0.0134566,0.370662>,<0.749248,0.166138,0.281764>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.386355,0.0313992,0.598808>,<0.54014,0.0224279,0.484735>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.386355,0.0313992,0.598808>,<0.29942,0.199123,0.621932>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.386355,0.0313992,0.598808>,<0.290666,-0.130687,0.627722>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,-0.654018>,<0.00483354,-0.292094,-0.655327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,-0.654018>,<-0.275298,-0.12489,-0.646327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,-0.654018>,<-0.280401,-0.453565,-0.616709>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,-0.656636>,<0.00483354,-0.292094,-0.655327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,-0.656636>,<0.284305,-0.457742,-0.628389>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,-0.656636>,<0.290666,-0.130687,-0.627722>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,-0.189864>,<0.729534,-0.148269,-0.280263>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,-0.189864>,<0.718424,-0.468998,-0.277572>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,-0.189864>,<0.765143,-0.309995,-6.12486e-017>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,0.189864>,<0.729534,-0.148269,0.280263>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,0.189864>,<0.718424,-0.468998,0.277572>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.765143,-0.309995,0.189864>,<0.765143,-0.309995,-6.12486e-017>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,0.656636>,<0.00483354,-0.292094,0.655327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,0.656636>,<0.284305,-0.457742,0.628389>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.194976,-0.292772,0.656636>,<0.290666,-0.130687,0.627722>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,0.654018>,<0.00483354,-0.292094,0.655327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,0.654018>,<-0.275298,-0.12489,0.646327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.185309,-0.291416,0.654018>,<-0.280401,-0.453565,0.616709>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,-0.682805>,<0.0219596,0.367629,-0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,-0.682805>,<-0.263695,0.533178,-0.682805>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,-0.682805>,<-0.266927,0.205023,-0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,-0.645056>,<0.0219596,0.367629,-0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,-0.645056>,<0.29942,0.199123,-0.621932>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,-0.645056>,<0.302793,0.528831,-0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.393101,0.690814,-0.538617>,<0.297161,0.856987,-0.538617>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.393101,0.690814,-0.538617>,<0.543361,0.675173,-0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.393101,0.690814,-0.538617>,<0.302793,0.528831,-0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.693622,0.659532,-0.308268>,<0.749097,0.489176,-0.250567>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693622,0.659532,-0.308268>,<0.543361,0.675173,-0.423442>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693622,0.659532,-0.308268>,<0.701561,0.773223,-0.154134>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.709499,0.886914,-2.74296e-016>,<0.619372,1.04302,-2.91933e-016>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.709499,0.886914,-2.74296e-016>,<0.701561,0.773223,0.154134>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.709499,0.886914,-2.74296e-016>,<0.701561,0.773223,-0.154134>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693622,0.659532,0.308268>,<0.749097,0.489176,0.250567>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693622,0.659532,0.308268>,<0.543361,0.675173,0.423442>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.693622,0.659532,0.308268>,<0.701561,0.773223,0.154134>0.0398,rgbt<0.200,0.600,0.890,0.000>,1)
VMD_cylinder(<0.393101,0.690814,0.538617>,<0.543361,0.675173,0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.393101,0.690814,0.538617>,<0.297161,0.856987,0.538617>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.393101,0.690814,0.538617>,<0.302793,0.528831,0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,0.645056>,<0.0219596,0.367629,0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,0.645056>,<0.29942,0.199123,0.621932>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.212486,0.366847,0.645056>,<0.302793,0.528831,0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,0.682805>,<0.0219596,0.367629,0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,0.682805>,<-0.263695,0.533178,0.682805>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.168566,0.368411,0.682805>,<-0.266927,0.205023,0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,0.638635>,<-0.275298,-0.12489,0.646327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,0.638635>,<-0.266927,0.205023,0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,0.638635>,<-0.544156,0.0444917,0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,0.507064>,<-0.790981,-0.107249,0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,0.507064>,<-0.544156,0.0444917,0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,0.507064>,<-0.818563,0.212822,0.507064>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,0.318626>,<-0.961853,-0.203884,0.159313>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,0.318626>,<-0.780323,-0.432898,0.348046>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,0.318626>,<-0.790981,-0.107249,0.412845>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-1.06477,-0.145921,1.32705e-016>,<-0.961853,-0.203884,0.159313>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-1.06477,-0.145921,1.32705e-016>,<-1.15856,0.016528,1.1435e-016>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-1.06477,-0.145921,1.32705e-016>,<-0.961853,-0.203884,-0.159313>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,-0.318626>,<-0.790981,-0.107249,-0.412845>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,-0.318626>,<-0.961853,-0.203884,-0.159313>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.858937,-0.261846,-0.318626>,<-0.780323,-0.432898,-0.348046>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,-0.507064>,<-0.544156,0.0444917,-0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,-0.507064>,<-0.790981,-0.107249,-0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.723026,0.0473481,-0.507064>,<-0.818563,0.212822,-0.507064>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,-0.638635>,<-0.275298,-0.12489,-0.646327>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,-0.638635>,<-0.266927,0.205023,-0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365287,0.0416354,-0.638635>,<-0.544156,0.0444917,-0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.740177,0.690966,0.638635>,<-0.5495,0.694455,0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.740177,0.690966,0.638635>,<-0.827139,0.534631,0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,0.682805>,<-0.263695,0.533178,0.682805>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,0.682805>,<-0.264236,0.863334,0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,0.682805>,<-0.5495,0.694455,0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,0.629476>,<-0.284774,-0.781821,0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,0.629476>,<-0.00440189,-0.947927,0.640508>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,0.629476>,<-0.284774,-1.11403,0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-1.28014,0.5794>,<-0.538602,-1.28602,0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-1.28014,0.5794>,<-0.284774,-1.11403,0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,0.651539>,<0.279442,-1.11053,0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,0.651539>,<0.279442,-0.78532,0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,0.651539>,<-0.00440189,-0.947927,0.640508>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,0.5794>,<-0.280401,-0.453565,0.616709>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,0.5794>,<-0.284774,-0.781821,0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,0.5794>,<-0.538602,-0.609832,0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,0.600143>,<0.52267,-0.625356,0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,0.600143>,<0.284305,-0.457742,0.628389>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,0.600143>,<0.279442,-0.78532,0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.169649,1.02872,0.645056>,<0.0157864,1.02594,0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.169649,1.02872,0.645056>,<-0.264236,0.863334,0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-1.27314,0.600143>,<0.279442,-1.11053,0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-1.27314,0.600143>,<0.52267,-1.2705,0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,0.507064>,<-1.08196,0.396745,0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,0.507064>,<-0.827139,0.534631,0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,0.507064>,<-0.818563,0.212822,0.507064>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,0.538617>,<0.0157864,1.02594,0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,0.538617>,<0.297161,0.856987,0.538617>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,0.538617>,<0.262807,1.16111,0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-1.2919,0.377466>,<-0.741664,-1.11992,0.281881>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-1.2919,0.377466>,<-0.538602,-1.28602,0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,0.377466>,<-0.780323,-0.432898,0.348046>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,0.377466>,<-0.741664,-0.775938,0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,0.377466>,<-0.538602,-0.609832,0.478433>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<0.671705,-0.628,0.365281>,<0.714473,-0.787963,0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-0.628,0.365281>,<0.52267,-0.625356,0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-0.628,0.365281>,<0.718424,-0.468998,0.277572>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.24982,0.415193,0.318626>,<-1.25109,0.297085,0.159313>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.24982,0.415193,0.318626>,<-1.08196,0.396745,0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-1.26785,0.365281>,<0.714473,-1.10789,0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-1.26785,0.365281>,<0.52267,-1.2705,0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,0.186296>,<-0.781619,-0.947927,2.45351e-016>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,0.186296>,<-0.741664,-1.11992,0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,0.186296>,<-0.741664,-0.775938,0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<0.324391,1.29906,0.308268>,<0.426818,1.24909,0.154134>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.324391,1.29906,0.308268>,<0.262807,1.16111,0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,0.190278>,<0.714473,-0.787963,0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,0.190278>,<0.75724,-0.947927,5.69014e-017>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,0.190278>,<0.714473,-1.10789,0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.25235,0.178977,9.59945e-017>,<-1.15856,0.016528,1.1435e-016>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.25235,0.178977,9.59945e-017>,<-1.25109,0.297085,0.159313>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.25235,0.178977,9.59945e-017>,<-1.25109,0.297085,-0.159313>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.529245,1.19912,-3.09571e-016>,<0.619372,1.04302,-2.91933e-016>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.529245,1.19912,-3.09571e-016>,<0.426818,1.24909,0.154134>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.529245,1.19912,-3.09571e-016>,<0.426818,1.24909,-0.154134>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,-0.186296>,<-0.741664,-1.11992,-0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,-0.186296>,<-0.781619,-0.947927,2.45351e-016>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.781619,-0.947927,-0.186296>,<-0.741664,-0.775938,-0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,-0.190278>,<0.714473,-1.10789,-0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,-0.190278>,<0.75724,-0.947927,5.69014e-017>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.75724,-0.947927,-0.190278>,<0.714473,-0.787963,-0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,-0.377466>,<-0.538602,-0.609832,-0.478433>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,-0.377466>,<-0.741664,-0.775938,-0.281881>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<-0.701709,-0.603949,-0.377466>,<-0.780323,-0.432898,-0.348046>0.0398,rgbt<0.700,0.200,0.100,0.000>,1)
VMD_cylinder(<0.671705,-0.628,-0.365281>,<0.52267,-0.625356,-0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-0.628,-0.365281>,<0.714473,-0.787963,-0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-0.628,-0.365281>,<0.718424,-0.468998,-0.277572>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.24982,0.415193,-0.318626>,<-1.08196,0.396745,-0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-1.24982,0.415193,-0.318626>,<-1.25109,0.297085,-0.159313>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-1.26785,-0.365281>,<0.714473,-1.10789,-0.277779>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.671705,-1.26785,-0.365281>,<0.52267,-1.2705,-0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-1.2919,-0.377466>,<-0.741664,-1.11992,-0.281881>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.701709,-1.2919,-0.377466>,<-0.538602,-1.28602,-0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.324391,1.29906,-0.308268>,<0.262807,1.16111,-0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.324391,1.29906,-0.308268>,<0.426818,1.24909,-0.154134>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,-0.5794>,<-0.280401,-0.453565,-0.616709>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,-0.5794>,<-0.538602,-0.609832,-0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-0.615715,-0.5794>,<-0.284774,-0.781821,-0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,-0.507064>,<-0.827139,0.534631,-0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,-0.507064>,<-1.08196,0.396745,-0.412845>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.9141,0.378297,-0.507064>,<-0.818563,0.212822,-0.507064>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,-0.600143>,<0.284305,-0.457742,-0.628389>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,-0.600143>,<0.52267,-0.625356,-0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-0.622712,-0.600143>,<0.279442,-0.78532,-0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-1.27314,-0.600143>,<0.52267,-1.2705,-0.482712>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.373634,-1.27314,-0.600143>,<0.279442,-1.11053,-0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,-0.538617>,<0.0157864,1.02594,-0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,-0.538617>,<0.297161,0.856987,-0.538617>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.201222,1.02316,-0.538617>,<0.262807,1.16111,-0.423442>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-1.28014,-0.5794>,<-0.538602,-1.28602,-0.478433>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.375494,-1.28014,-0.5794>,<-0.284774,-1.11403,-0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,-0.629476>,<-0.284774,-0.781821,-0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,-0.629476>,<-0.00440189,-0.947927,-0.640508>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.194053,-0.947927,-0.629476>,<-0.284774,-1.11403,-0.604438>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,-0.651539>,<0.279442,-1.11053,-0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,-0.651539>,<0.279442,-0.78532,-0.625841>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.185249,-0.947927,-0.651539>,<-0.00440189,-0.947927,-0.640508>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.740177,0.690966,-0.638635>,<-0.5495,0.694455,-0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.740177,0.690966,-0.638635>,<-0.827139,0.534631,-0.572849>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.169649,1.02872,-0.645056>,<0.0157864,1.02594,-0.591837>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.169649,1.02872,-0.645056>,<-0.264236,0.863334,-0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,-0.682805>,<-0.263695,0.533178,-0.682805>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,-0.682805>,<-0.264236,0.863334,-0.663931>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.358823,0.697945,-0.682805>,<-0.5495,0.694455,-0.66072>0.0398,rgbt<0.350,0.350,0.350,0.000>,1)
// End of POV-Ray 3.x generation 

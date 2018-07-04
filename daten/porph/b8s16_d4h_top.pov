// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/b8s16_d4h_top.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/b8s16_d4h_top.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/b8s16_d4h_top.pov.tga +P +X +A +FT +C
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
// MoleculeID: 1 ReprID: 0 Beginning CPK
// MoleculeID: 1 ReprID: 0 Beginning VDW
VMD_sphere(<-0.7753,-0.7753,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.8625,-0.3375,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<-0.3375,-0.8625,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<-0.5750,0.0000,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-1.2960,-0.2540,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.0000,-0.5750,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.2540,-1.2960,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.8625,0.3375,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<-1.2960,0.2540,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.3375,-0.8625,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<0.2540,-1.2960,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.7753,0.7753,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.7753,-0.7753,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.3375,0.8625,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<0.8625,-0.3375,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<0.0000,0.5750,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<-0.2540,1.2960,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.5750,0.0000,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<1.2960,-0.2540,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.3375,0.8625,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<0.2540,1.2960,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.8625,0.3375,0.0000>,0.0490,rgbt<0.500,0.300,0.000,0.000>)
VMD_sphere(<1.2960,0.2540,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_sphere(<0.7753,0.7753,0.0000>,0.0441,rgbt<0.800,0.700,0.100,0.000>)
VMD_cylinder(<-0.775324,-0.775324,0>,<-0.556423,-0.818935,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.775324,-0.775324,0>,<-0.818935,-0.556423,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.862545,-0.337522,0>,<-1.07927,-0.295782,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.862545,-0.337522,0>,<-0.718769,-0.168761,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.862545,-0.337522,0>,<-0.818935,-0.556423,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.337522,-0.862545,0>,<-0.295782,-1.07927,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.337522,-0.862545,0>,<-0.168761,-0.718769,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.337522,-0.862545,0>,<-0.556423,-0.818935,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.574993,0,0>,<-0.718769,-0.168761,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.574993,0,0>,<-0.718769,0.168761,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-1.296,-0.254043,0>,<-1.07927,-0.295782,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-1.296,-0.254043,0>,<-1.296,0,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0,-0.574993,0>,<0.168761,-0.718769,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0,-0.574993,0>,<-0.168761,-0.718769,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.254043,-1.296,0>,<-0.295782,-1.07927,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.254043,-1.296,0>,<0,-1.296,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.862545,0.337522,0>,<-1.07927,0.295782,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.862545,0.337522,0>,<-0.718769,0.168761,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.862545,0.337522,0>,<-0.818935,0.556423,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-1.296,0.254043,0>,<-1.296,0,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-1.296,0.254043,0>,<-1.07927,0.295782,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.337522,-0.862545,0>,<0.295782,-1.07927,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.337522,-0.862545,0>,<0.556423,-0.818935,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.337522,-0.862545,0>,<0.168761,-0.718769,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.254043,-1.296,0>,<0.295782,-1.07927,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.254043,-1.296,0>,<0,-1.296,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.775324,0.775324,0>,<-0.556423,0.818935,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.775324,0.775324,0>,<-0.818935,0.556423,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.775324,-0.775324,0>,<0.818935,-0.556423,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.775324,-0.775324,0>,<0.556423,-0.818935,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.337522,0.862545,0>,<-0.556423,0.818935,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.337522,0.862545,0>,<-0.168761,0.718769,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<-0.337522,0.862545,0>,<-0.295782,1.07927,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.862545,-0.337522,0>,<0.818935,-0.556423,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.862545,-0.337522,0>,<1.07927,-0.295782,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.862545,-0.337522,0>,<0.718769,-0.168761,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0,0.574993,0>,<0.168761,0.718769,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0,0.574993,0>,<-0.168761,0.718769,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.254043,1.296,0>,<0,1.296,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<-0.254043,1.296,0>,<-0.295782,1.07927,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.574993,0,0>,<0.718769,0.168761,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.574993,0,0>,<0.718769,-0.168761,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<1.296,-0.254043,0>,<1.296,0,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<1.296,-0.254043,0>,<1.07927,-0.295782,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.337522,0.862545,0>,<0.168761,0.718769,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.337522,0.862545,0>,<0.556423,0.818935,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.337522,0.862545,0>,<0.295782,1.07927,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.254043,1.296,0>,<0,1.296,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.254043,1.296,0>,<0.295782,1.07927,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.862545,0.337522,0>,<0.718769,0.168761,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.862545,0.337522,0>,<1.07927,0.295782,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<0.862545,0.337522,0>,<0.818935,0.556423,0>0.0123,rgbt<0.500,0.300,0.000,0.000>,1)
VMD_cylinder(<1.296,0.254043,0>,<1.07927,0.295782,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<1.296,0.254043,0>,<1.296,0,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.775324,0.775324,0>,<0.818935,0.556423,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
VMD_cylinder(<0.775324,0.775324,0>,<0.556423,0.818935,0>0.0123,rgbt<0.800,0.700,0.100,0.000>,1)
// End of POV-Ray 3.x generation 

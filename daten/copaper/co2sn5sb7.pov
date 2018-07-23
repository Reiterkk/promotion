// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co2sn5sb7.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co2sn5sb7.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co2sn5sb7.pov.tga +P +X +A +FT +C
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
// MoleculeID: 0 ReprID: 0 Beginning CPK
// MoleculeID: 0 ReprID: 0 Beginning VDW
VMD_sphere(<0.3125,0.1180,1.0314>,0.1001,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.3058,-0.1222,-1.0168>,0.1001,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<1.0186,0.0054,-0.3248>,0.1001,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-1.0323,-0.0113,0.3301>,0.1001,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.5145,-1.3283,-0.7415>,0.1001,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.7739,-1.3497,-0.3169>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.3836,1.1946,-0.9552>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.7755,1.3473,0.3174>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.5007,1.3532,0.7088>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.8959,1.1844,-0.5552>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.3752,-1.2253,0.9441>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.8937,-1.1912,0.5536>,0.0923,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.0165,-0.5431,0.0692>,0.0923,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.0311,0.5683,-0.0444>,0.0923,rgbt<0.100,0.700,0.200,0.000>)
VMD_cylinder(<0.312473,0.118031,1.03144>,<0.603111,-0.536591,0.792539>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.312473,0.118031,1.03144>,<-0.0313509,-0.553647,0.987783>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.312473,0.118031,1.03144>,<0.665546,0.0616936,0.353322>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.312473,0.118031,1.03144>,<-0.359908,0.0533688,0.680793>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.312473,0.118031,1.03144>,<0.543969,0.732644,0.674423>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.312473,0.118031,1.03144>,<-0.0941145,0.735617,0.870131>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<-0.539845,-0.735953,-0.666891>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<0.104327,-0.725258,-0.879174>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<0.356404,-0.0584129,-0.670817>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<-0.66905,-0.0667377,-0.343346>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<0.0388873,0.536225,-0.985997>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.30581,-0.122182,-1.01684>,<-0.600841,0.531087,-0.786>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.766542,-0.661489,-0.53315>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.956183,-0.592929,0.114423>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.356404,-0.0584129,-0.670817>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.665546,0.0616936,0.353322>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.701101,0.599993,-0.639973>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.01862,0.0053557,-0.324793>,<0.897042,0.676306,-0.00369221>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.703732,-0.61831,0.637139>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.903085,-0.680509,0.00660423>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.359908,0.0533688,0.680793>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.66905,-0.0667377,-0.343346>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.766496,0.670954,0.519487>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.03229,-0.0112939,0.330149>,<-0.964081,0.586531,-0.112504>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.514465,-1.32833,-0.741507>,<0.704107,-1.25977,-0.0939337>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.514465,-1.32833,-0.741507>,<-0.129708,-1.33903,-0.529224>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.514465,-1.32833,-0.741507>,<0.104327,-0.725258,-0.879174>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.514465,-1.32833,-0.741507>,<0.766542,-0.661489,-0.53315>0.0231,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.773881,-1.34972,-0.316941>,<-0.574528,-1.28752,0.313594>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.773881,-1.34972,-0.316941>,<-0.129708,-1.33903,-0.529224>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.773881,-1.34972,-0.316941>,<-0.539845,-0.735953,-0.666891>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.773881,-1.34972,-0.316941>,<-0.903085,-0.680509,0.00660423>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.383585,1.19463,-0.955154>,<0.0388873,0.536225,-0.985997>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.383585,1.19463,-0.955154>,<0.701101,0.599993,-0.639973>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.383585,1.19463,-0.955154>,<-0.256144,1.18949,-0.755156>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.383585,1.19463,-0.955154>,<0.579525,1.27094,-0.318873>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.775465,1.34726,0.317408>,<0.897042,0.676306,-0.00369221>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.775465,1.34726,0.317408>,<0.543969,0.732644,0.674423>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.775465,1.34726,0.317408>,<0.579525,1.27094,-0.318873>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.775465,1.34726,0.317408>,<0.137381,1.35023,0.513117>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.500702,1.3532,0.708825>,<-0.0941145,0.735617,0.870131>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.500702,1.3532,0.708825>,<-0.766496,0.670954,0.519487>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.500702,1.3532,0.708825>,<0.137381,1.35023,0.513117>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.500702,1.3532,0.708825>,<-0.698287,1.26878,0.0768334>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.895872,1.18436,-0.555158>,<-0.964081,0.586531,-0.112504>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.895872,1.18436,-0.555158>,<-0.600841,0.531087,-0.786>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.895872,1.18436,-0.555158>,<-0.256144,1.18949,-0.755156>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.895872,1.18436,-0.555158>,<-0.698287,1.26878,0.0768334>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.375175,-1.22533,0.944129>,<-0.574528,-1.28752,0.313594>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.375175,-1.22533,0.944129>,<0.259287,-1.20827,0.748884>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.375175,-1.22533,0.944129>,<-0.0313509,-0.553647,0.987783>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.375175,-1.22533,0.944129>,<-0.703732,-0.61831,0.637139>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.893749,-1.19121,0.55364>,<0.259287,-1.20827,0.748884>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.893749,-1.19121,0.55364>,<0.704107,-1.25977,-0.0939337>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.893749,-1.19121,0.55364>,<0.956183,-0.592929,0.114423>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.893749,-1.19121,0.55364>,<0.603111,-0.536591,0.792539>0.0231,rgbt<1.000,0.000,0.660,0.000>,1)
// End of POV-Ray 3.x generation 

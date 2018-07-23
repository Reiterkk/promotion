// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_aa.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_aa.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_aa.pov.tga +P +X +A +FT +C
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
VMD_sphere(<-0.4047,-1.0836,0.9406>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.7501,1.3619,0.3074>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.9418,0.0679,0.2392>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.2910,-0.0162,-0.9713>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.2980,0.1805,0.9287>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.8366,1.1780,-0.5606>,0.0961,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.7299,-1.2855,-0.2963>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.9044,0.1500,-0.2832>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.4686,-1.3246,-0.6362>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.8156,-1.1887,0.5503>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.4825,1.2537,0.6867>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.4022,1.1937,-0.9255>,0.0886,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.0477,-0.4872,0.0202>,0.0886,rgbt<0.100,0.700,0.200,0.000>)
VMD_cylinder(<-0.404669,-1.08359,0.940608>,<-0.673209,-0.507824,0.58992>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.404669,-1.08359,0.940608>,<-0.053356,-0.451566,0.934637>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.404669,-1.08359,0.940608>,<-0.567273,-1.18452,0.32215>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.404669,-1.08359,0.940608>,<0.20545,-1.13616,0.745447>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.750063,1.36187,0.307355>,<0.133772,1.3078,0.497049>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.750063,1.36187,0.307355>,<0.576118,1.27779,-0.309088>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.750063,1.36187,0.307355>,<0.52401,0.771161,0.618011>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.750063,1.36187,0.307355>,<0.827218,0.755914,0.0120935>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.889186,0.622982,-0.160681>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.712135,0.660841,0.462988>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.321897,0.124199,0.58395>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.616376,0.0258865,-0.366022>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.673209,-0.507824,0.58992>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.94175,0.0679406,0.239232>,<-0.835813,-0.608755,-0.028538>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<0.0555861,0.588769,-0.948403>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<-0.563811,0.580928,-0.765935>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<0.306685,0.0668977,-0.627222>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<-0.616376,0.0258865,-0.366022>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<0.0887851,-0.670385,-0.803739>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.291001,-0.0161677,-0.971275>,<-0.510439,-0.650809,-0.633792>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<-0.0922815,0.717099,0.807705>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<0.52401,0.771161,0.618011>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<-0.321897,0.124199,0.58395>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<0.601164,0.16521,0.322749>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<-0.053356,-0.451566,0.934637>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.297957,0.180457,0.928667>,<0.556762,-0.504133,0.739477>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.836621,1.17802,-0.560595>,<-0.659571,1.21588,0.063074>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.836621,1.17802,-0.560595>,<-0.217224,1.18587,-0.743063>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.836621,1.17802,-0.560595>,<-0.889186,0.622982,-0.160681>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.836621,1.17802,-0.560595>,<-0.563811,0.580928,-0.765935>0.0221,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.729877,-1.28545,-0.296308>,<-0.510439,-0.650809,-0.633792>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.729877,-1.28545,-0.296308>,<-0.835813,-0.608755,-0.028538>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.729877,-1.28545,-0.296308>,<-0.567273,-1.18452,0.32215>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.729877,-1.28545,-0.296308>,<-0.130653,-1.30503,-0.466255>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.827218,0.755914,0.0120935>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.653273,0.671835,-0.604349>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.601164,0.16521,0.322749>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.306685,0.0668977,-0.627222>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.85997,-0.51938,0.133559>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.904372,0.149963,-0.283168>,<0.686472,-0.58732,-0.459685>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.468571,-1.3246,-0.636202>,<0.686472,-0.58732,-0.459685>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.468571,-1.3246,-0.636202>,<0.0887851,-0.670385,-0.803739>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.468571,-1.3246,-0.636202>,<0.64207,-1.25666,-0.0429575>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.468571,-1.3246,-0.636202>,<-0.130653,-1.30503,-0.466255>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.815568,-1.18872,0.550287>,<0.556762,-0.504133,0.739477>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.815568,-1.18872,0.550287>,<0.85997,-0.51938,0.133559>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.815568,-1.18872,0.550287>,<0.20545,-1.13616,0.745447>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.815568,-1.18872,0.550287>,<0.64207,-1.25666,-0.0429575>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.48252,1.25374,0.686743>,<-0.659571,1.21588,0.063074>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.48252,1.25374,0.686743>,<0.133772,1.3078,0.497049>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.48252,1.25374,0.686743>,<-0.712135,0.660841,0.462988>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.48252,1.25374,0.686743>,<-0.0922815,0.717099,0.807705>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.402174,1.19371,-0.925531>,<0.576118,1.27779,-0.309088>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.402174,1.19371,-0.925531>,<-0.217224,1.18587,-0.743063>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.402174,1.19371,-0.925531>,<0.653273,0.671835,-0.604349>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.402174,1.19371,-0.925531>,<0.0555861,0.588769,-0.948403>0.0221,rgbt<1.000,0.000,0.660,0.000>,1)
// End of POV-Ray 3.x generation 

// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/z2.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/z2.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/nanotori/z2.pov.tga +P +X +A +FT +C
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
// MoleculeID: 8 ReprID: 0 Beginning CPK
// MoleculeID: 8 ReprID: 0 Beginning VDW
VMD_sphere(<-1.7071,0.1635,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,0.3317,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,0.3317,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,0.4440,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,0.4835,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,0.4835,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,0.4440,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,0.3317,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,0.3317,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,0.1635,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,-0.0348,-0.5438>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,-0.0348,-0.5438>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,-0.2331,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,-0.4013,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,-0.4013,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,-0.5136,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,-0.5531,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,-0.5531,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,-0.5136,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,-0.4013,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,-0.4013,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.7071,-0.2331,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.3557,-0.0348,0.4927>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.5896,-0.0348,0.4927>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,0.1635,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,0.1635,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,0.3317,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,0.3317,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,0.4440,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,0.4440,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,0.4835,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,0.4835,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,0.4440,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,0.4440,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,0.3317,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,0.3317,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,0.1635,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,0.1635,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,-0.0348,-0.5438>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,-0.0348,-0.5438>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,-0.2331,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,-0.2331,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,-0.4013,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,-0.4013,-0.3920>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,-0.5136,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,-0.5136,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,-0.5531,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,-0.5531,-0.0256>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,-0.5136,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,-0.5136,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,-0.4013,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,-0.4013,0.3409>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.0043,-0.2331,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-1.2382,-0.2331,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.6530,-0.0348,0.4927>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.8868,-0.0348,0.4927>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,0.1635,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,0.4440,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,0.4440,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,0.1635,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,-0.2331,-0.5044>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,-0.5136,-0.2239>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,-0.5136,0.1728>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_sphere(<-0.5355,-0.2331,0.4533>,0.0839,rgbt<0.100,0.700,0.200,0.000>)
VMD_cylinder(<-1.7071,0.163524,0.45326>,<-1.64834,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.163524,0.45326>,<-1.64834,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,0.340914>,<-1.47265,0.331659,0.340914>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,0.340914>,<-1.29696,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,0.340914>,<-1.29696,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,0.340914>,<-1.64834,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,0.340914>,<-1.47265,0.331659,0.340914>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,0.340914>,<-1.64834,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.444005,0.172778>,<-1.64834,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.444005,0.172778>,<-1.64834,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.483455,-0.025552>,<-1.29696,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.483455,-0.025552>,<-1.47265,0.483455,-0.025552>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.483455,-0.025552>,<-1.29696,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.483455,-0.025552>,<-1.64834,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.483455,-0.025552>,<-1.64834,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.483455,-0.025552>,<-1.47265,0.483455,-0.025552>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.444004,-0.223883>,<-1.64834,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.444004,-0.223883>,<-1.64834,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,-0.39202>,<-1.47265,0.331659,-0.39202>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,-0.39202>,<-1.29696,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,0.331659,-0.39202>,<-1.29696,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,-0.39202>,<-1.64834,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,-0.39202>,<-1.47265,0.331659,-0.39202>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,0.331659,-0.39202>,<-1.64834,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.163523,-0.504365>,<-1.64834,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,0.163523,-0.504365>,<-1.64834,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348079,-0.543814>,<-1.29696,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348079,-0.543814>,<-1.47265,-0.0348079,-0.543814>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348079,-0.543814>,<-1.29696,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348079,-0.543814>,<-1.64834,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348079,-0.543814>,<-1.64834,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348079,-0.543814>,<-1.47265,-0.0348079,-0.543814>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.233137,-0.504365>,<-1.64834,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.233137,-0.504365>,<-1.64834,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401274,-0.392019>,<-1.47265,-0.401274,-0.392019>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401274,-0.392019>,<-1.29696,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401274,-0.392019>,<-1.29696,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401274,-0.392019>,<-1.64834,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401274,-0.392019>,<-1.64834,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401274,-0.392019>,<-1.47265,-0.401274,-0.392019>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.513619,-0.223883>,<-1.64834,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.513619,-0.223883>,<-1.64834,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.55307,-0.0255526>,<-1.47265,-0.55307,-0.0255526>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.55307,-0.0255526>,<-1.29696,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.55307,-0.0255526>,<-1.29696,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.55307,-0.0255526>,<-1.64834,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.55307,-0.0255526>,<-1.64834,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.55307,-0.0255526>,<-1.47265,-0.55307,-0.0255526>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.513619,0.172778>,<-1.64834,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.513619,0.172778>,<-1.64834,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401275,0.340915>,<-1.47265,-0.401275,0.340915>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401275,0.340915>,<-1.29696,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.401275,0.340915>,<-1.29696,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401275,0.340915>,<-1.64834,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401275,0.340915>,<-1.47265,-0.401275,0.340915>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.401275,0.340915>,<-1.64834,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.233137,0.453259>,<-1.64834,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.7071,-0.233137,0.453259>,<-1.64834,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348076,0.492709>,<-1.47265,-0.0348076,0.492709>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348076,0.492709>,<-1.29696,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.35572,-0.0348076,0.492709>,<-1.29696,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348076,0.492709>,<-1.64834,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348076,0.492709>,<-1.47265,-0.0348076,0.492709>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.58959,-0.0348076,0.492709>,<-1.64834,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163524,0.45326>,<-1.12128,0.163524,0.45326>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163524,0.45326>,<-0.945585,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163524,0.45326>,<-0.945585,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163524,0.45326>,<-1.12128,0.163524,0.45326>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163524,0.45326>,<-1.29696,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163524,0.45326>,<-1.29696,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,0.340914>,<-0.769894,0.331659,0.340914>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,0.340914>,<-0.594205,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,0.340914>,<-0.594205,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,0.340914>,<-0.945585,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,0.340914>,<-0.769894,0.331659,0.340914>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,0.340914>,<-0.945585,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444005,0.172778>,<-1.12128,0.444005,0.172778>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444005,0.172778>,<-0.945585,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444005,0.172778>,<-0.945585,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444005,0.172778>,<-1.29696,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444005,0.172778>,<-1.29696,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444005,0.172778>,<-1.12128,0.444005,0.172778>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.483455,-0.025552>,<-0.594205,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.483455,-0.025552>,<-0.769894,0.483455,-0.025552>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.483455,-0.025552>,<-0.594205,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.483455,-0.025552>,<-0.945585,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.483455,-0.025552>,<-0.945585,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.483455,-0.025552>,<-0.769894,0.483455,-0.025552>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444004,-0.223883>,<-1.12128,0.444004,-0.223883>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444004,-0.223883>,<-0.945585,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.444004,-0.223883>,<-0.945585,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444004,-0.223883>,<-1.12128,0.444004,-0.223883>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444004,-0.223883>,<-1.29696,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.444004,-0.223883>,<-1.29696,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,-0.39202>,<-0.769894,0.331659,-0.39202>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,-0.39202>,<-0.594205,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,0.331659,-0.39202>,<-0.594205,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,-0.39202>,<-0.945585,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,-0.39202>,<-0.769894,0.331659,-0.39202>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,0.331659,-0.39202>,<-0.945585,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163523,-0.504365>,<-1.12128,0.163523,-0.504365>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163523,-0.504365>,<-0.945585,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,0.163523,-0.504365>,<-0.945585,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163523,-0.504365>,<-1.29696,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163523,-0.504365>,<-1.29696,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,0.163523,-0.504365>,<-1.12128,0.163523,-0.504365>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348079,-0.543814>,<-0.594205,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348079,-0.543814>,<-0.769894,-0.0348079,-0.543814>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348079,-0.543814>,<-0.594205,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348079,-0.543814>,<-0.945585,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348079,-0.543814>,<-0.945585,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348079,-0.543814>,<-0.769894,-0.0348079,-0.543814>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,-0.504365>,<-1.12128,-0.233137,-0.504365>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,-0.504365>,<-0.945585,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,-0.504365>,<-0.945585,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,-0.504365>,<-1.29696,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,-0.504365>,<-1.12128,-0.233137,-0.504365>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,-0.504365>,<-1.29696,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401274,-0.392019>,<-0.769894,-0.401274,-0.392019>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401274,-0.392019>,<-0.594205,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401274,-0.392019>,<-0.594205,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401274,-0.392019>,<-0.945585,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401274,-0.392019>,<-0.945585,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401274,-0.392019>,<-0.769894,-0.401274,-0.392019>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,-0.223883>,<-1.12128,-0.513619,-0.223883>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,-0.223883>,<-0.945585,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,-0.223883>,<-0.945585,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,-0.223883>,<-1.29696,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,-0.223883>,<-1.29696,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,-0.223883>,<-1.12128,-0.513619,-0.223883>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.55307,-0.0255526>,<-0.769894,-0.55307,-0.0255526>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.55307,-0.0255526>,<-0.594205,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.55307,-0.0255526>,<-0.594205,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.55307,-0.0255526>,<-0.945585,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.55307,-0.0255526>,<-0.945585,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.55307,-0.0255526>,<-0.769894,-0.55307,-0.0255526>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,0.172778>,<-1.12128,-0.513619,0.172778>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,0.172778>,<-0.945585,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.513619,0.172778>,<-0.945585,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,0.172778>,<-1.29696,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,0.172778>,<-1.12128,-0.513619,0.172778>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.513619,0.172778>,<-1.29696,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401275,0.340915>,<-0.769894,-0.401275,0.340915>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401275,0.340915>,<-0.594205,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.401275,0.340915>,<-0.594205,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401275,0.340915>,<-0.945585,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401275,0.340915>,<-0.769894,-0.401275,0.340915>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.401275,0.340915>,<-0.945585,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,0.453259>,<-1.12128,-0.233137,0.453259>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,0.453259>,<-0.945585,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.00434,-0.233137,0.453259>,<-0.945585,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,0.453259>,<-1.29696,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,0.453259>,<-1.29696,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-1.23821,-0.233137,0.453259>,<-1.12128,-0.233137,0.453259>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348076,0.492709>,<-0.769894,-0.0348076,0.492709>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348076,0.492709>,<-0.594205,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.652956,-0.0348076,0.492709>,<-0.594205,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348076,0.492709>,<-0.945585,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348076,0.492709>,<-0.769894,-0.0348076,0.492709>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.886832,-0.0348076,0.492709>,<-0.945585,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.163524,0.45326>,<-0.594205,0.064358,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.163524,0.45326>,<-0.594205,0.247591,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.444005,0.172778>,<-0.594205,0.387832,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.444005,0.172778>,<-0.594205,0.46373,0.0736128>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.444004,-0.223883>,<-0.594205,0.463729,-0.124717>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.444004,-0.223883>,<-0.594205,0.387831,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.163523,-0.504365>,<-0.594205,0.247591,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,0.163523,-0.504365>,<-0.594205,0.0643578,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.233137,-0.504365>,<-0.594205,-0.133973,-0.524089>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.233137,-0.504365>,<-0.594205,-0.317206,-0.448192>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.513619,-0.223883>,<-0.594205,-0.457446,-0.307951>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.513619,-0.223883>,<-0.594205,-0.533345,-0.124718>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.513619,0.172778>,<-0.594205,-0.457447,0.256846>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.513619,0.172778>,<-0.594205,-0.533345,0.0736126>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.233137,0.453259>,<-0.594205,-0.317206,0.397087>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
VMD_cylinder(<-0.535453,-0.233137,0.453259>,<-0.594205,-0.133972,0.472984>0.0247,rgbt<0.100,0.700,0.200,0.000>,1)
// End of POV-Ray 3.x generation 

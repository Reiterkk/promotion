// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_a.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_a.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/copaper/co1sn6sb6_a.pov.tga +P +X +A +FT +C
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
// MoleculeID: 2 ReprID: 0 Beginning CPK
// MoleculeID: 2 ReprID: 0 Beginning VDW
VMD_sphere(<-0.9847,0.1058,0.2720>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.8093,1.2104,-0.6123>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.8178,1.3359,0.1982>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.9844,0.0067,-0.2925>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.4497,-1.0533,1.0119>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.4416,-1.3255,-0.6234>,0.0970,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.4277,1.0905,-1.0151>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.2928,-0.0438,-0.9076>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.7809,-1.1648,0.6133>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<0.2943,0.2440,0.8744>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.7887,-1.2950,-0.2121>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.4200,1.3570,0.6175>,0.0894,rgbt<1.000,0.000,0.660,0.000>)
VMD_sphere(<-0.0015,-0.4679,0.0758>,0.0894,rgbt<0.100,0.700,0.200,0.000>)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.71718,-0.473746,0.641922>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.886667,-0.594629,0.029931>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.345193,0.174882,0.573206>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.638747,0.0310106,-0.317825>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.702345,0.731381,0.444745>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.984667,0.105772,0.271973>,<-0.896962,0.658065,-0.170155>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.809256,1.21036,-0.612284>,<-0.896962,0.658065,-0.170155>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.809256,1.21036,-0.612284>,<-0.551042,0.583304,-0.759953>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.809256,1.21036,-0.612284>,<-0.190779,1.15042,-0.813695>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.809256,1.21036,-0.612284>,<-0.61464,1.28367,0.00261662>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.817823,1.33593,0.198195>,<0.901133,0.671305,-0.0471711>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.817823,1.33593,0.198195>,<0.556052,0.789963,0.536317>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.817823,1.33593,0.198195>,<0.622761,1.21321,-0.408456>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.817823,1.33593,0.198195>,<0.1989,1.34646,0.407856>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.713013,-0.659405,-0.457992>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.882647,-0.57907,0.160373>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.345808,-0.0185369,-0.60008>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.639362,0.125334,0.290951>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.706071,0.548584,-0.653822>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.984443,0.00667668,-0.292537>,<0.901133,0.671305,-0.0471711>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.449693,-1.05326,1.01187>,<0.16558,-1.10904,0.812577>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.449693,-1.05326,1.01187>,<-0.61918,-1.17415,0.39988>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.449693,-1.05326,1.01187>,<-0.077706,-0.404636,0.943155>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.449693,-1.05326,1.01187>,<-0.71718,-0.473746,0.641922>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.441584,-1.32549,-0.623446>,<-0.173541,-1.31026,-0.417779>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.441584,-1.32549,-0.623446>,<0.611218,-1.24515,-0.00508143>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.441584,-1.32549,-0.623446>,<0.0743783,-0.684619,-0.765534>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.441584,-1.32549,-0.623446>,<0.713013,-0.659405,-0.457992>0.0224,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.427699,1.09049,-1.01511>,<0.0674356,0.52337,-0.961364>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.427699,1.09049,-1.01511>,<0.706071,0.548584,-0.653822>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.427699,1.09049,-1.01511>,<0.622761,1.21321,-0.408456>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.427699,1.09049,-1.01511>,<-0.190779,1.15042,-0.813695>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<-0.540747,-0.66939,-0.559866>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<0.0743783,-0.684619,-0.765534>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<-0.638747,0.0310106,-0.317825>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<0.345808,-0.0185369,-0.60008>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<-0.551042,0.583304,-0.759953>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.292827,-0.0437505,-0.907622>,<0.0674356,0.52337,-0.961364>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.780852,-1.16482,0.613284>,<0.16558,-1.10904,0.812577>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.780852,-1.16482,0.613284>,<0.611218,-1.24515,-0.00508143>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.780852,-1.16482,0.613284>,<0.537566,-0.460413,0.743861>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.780852,-1.16482,0.613284>,<0.882647,-0.57907,0.160373>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<0.537566,-0.460413,0.743861>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<-0.077706,-0.404636,0.943155>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<-0.345193,0.174882,0.573206>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<0.639362,0.125334,0.290951>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<-0.0628713,0.800491,0.745978>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<0.294281,0.243992,0.874439>,<0.556052,0.789963,0.536317>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.788666,-1.29503,-0.212111>,<-0.61918,-1.17415,0.39988>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.788666,-1.29503,-0.212111>,<-0.173541,-1.31026,-0.417779>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.788666,-1.29503,-0.212111>,<-0.886667,-0.594629,0.029931>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.788666,-1.29503,-0.212111>,<-0.540747,-0.66939,-0.559866>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.420023,1.35699,0.617517>,<-0.0628713,0.800491,0.745978>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.420023,1.35699,0.617517>,<-0.702345,0.731381,0.444745>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.420023,1.35699,0.617517>,<-0.61464,1.28367,0.00261662>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
VMD_cylinder(<-0.420023,1.35699,0.617517>,<0.1989,1.34646,0.407856>0.0224,rgbt<1.000,0.000,0.660,0.000>,1)
// End of POV-Ray 3.x generation 

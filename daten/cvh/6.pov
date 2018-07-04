// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/cvh/6.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/cvh/6.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/cvh/6.pov.tga +P +X +A +FT +C
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
// MoleculeID: 4 ReprID: 0 Beginning CPK
// MoleculeID: 4 ReprID: 0 Beginning VDW
VMD_sphere(<0.3943,0.0005,0.0507>,0.0197,rgbt<1.000,0.600,0.600,0.000>)
VMD_sphere(<-0.0048,0.0275,-0.1852>,0.0332,rgbt<0.900,0.500,0.000,0.000>)
VMD_sphere(<0.2875,-0.0659,0.4552>,0.0418,rgbt<0.550,0.900,0.020,0.000>)
VMD_sphere(<0.5379,0.3486,0.0212>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.5733,-0.3049,-0.0762>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.8015,0.3379,0.1233>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.2559,-0.0145,0.0260>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.0207,0.2894,-0.1692>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.0572,0.2787,0.5047>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.3873,0.5333,0.1709>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.5448,0.4299,-0.2492>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.4013,-0.5275,-0.0750>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.6618,-0.2558,-0.3399>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.7945,-0.3577,0.0917>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.9205,0.2143,0.0150>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.8867,0.5235,0.1181>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.8053,0.2748,0.3162>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3874,0.1647,0.1404>,0.0286,rgbt<0.100,0.200,0.700,0.000>)
VMD_sphere(<-0.3508,-0.2376,0.0865>,0.0286,rgbt<0.100,0.200,0.700,0.000>)
VMD_sphere(<-0.1782,0.4365,0.5443>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<0.3763,0.4804,0.3664>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.4726,0.7187,0.1612>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.1977,0.5512,0.1013>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.3589,0.4428,-0.3299>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.6293,0.6152,-0.2651>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.6538,0.3040,-0.3650>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.2380,-0.4992,-0.1921>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.4982,-0.6932,-0.1451>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.3364,-0.5699,0.1122>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.7942,-0.1023,-0.3490>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.7557,-0.4209,-0.4152>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.5076,-0.2125,-0.4649>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.7365,-0.3890,0.2836>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.8925,-0.5255,0.0286>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.9291,-0.2059,0.0919>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3611,0.4254,0.1140>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.6036,0.0616,0.2689>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.2934,-0.4696,-0.0244>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.5441,-0.2138,0.2766>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.2632,0.5613,0.3122>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.0766,0.5665,0.6613>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3350,0.3668,0.6530>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.4455,0.5416,-0.1024>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.6221,0.1429,0.4531>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.7721,0.1031,0.1629>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3652,-0.5134,-0.2706>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1824,-0.6555,0.1189>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.7021,-0.3310,0.2297>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.4717,-0.2706,0.4573>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2446,0.8171,0.2859>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.4212,0.7977,-0.1198>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.5579,0.3966,-0.3101>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3094,-0.7428,-0.3742>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.5023,-0.3245,-0.4198>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1350,-0.8829,0.0072>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1122,-0.6140,0.3836>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1659,0.9240,0.4374>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3197,0.9385,0.0711>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.4848,0.8896,-0.2875>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.7014,0.2692,-0.2445>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.6414,0.5207,-0.4463>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.4182,0.2838,-0.4049>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3626,-0.7776,-0.5655>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.1926,-0.9292,-0.2397>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.3778,-0.1771,-0.4831>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.5868,-0.4106,-0.5822>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.6486,-0.2353,-0.3113>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.0452,-1.0265,0.1163>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2735,-0.6290,0.5064>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.0214,-0.7536,0.4436>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.0289,-0.4313,0.4118>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2879,1.2127,0.0444>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.1271,-1.1712,-0.3582>,0.0313,rgbt<0.350,0.350,0.350,0.000>)
VMD_sphere(<-0.4241,1.2911,-0.0834>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.3051,1.3070,0.2228>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.1036,1.2562,-0.0293>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<0.0618,-1.1652,-0.4327>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.1343,-1.3235,-0.2248>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_sphere(<-0.2514,-1.2145,-0.5122>,0.0184,rgbt<1.000,1.000,1.000,0.000>)
VMD_cylinder(<0.394306,0.00053347,0.0506996>,<0.466121,0.174552,0.0359316>0.0092,rgbt<1.000,0.600,0.600,0.000>,1)
VMD_cylinder(<0.394306,0.00053347,0.0506996>,<0.483819,-0.152162,-0.0127266>0.0092,rgbt<1.000,0.600,0.600,0.000>,1)
VMD_cylinder(<0.394306,0.00053347,0.0506996>,<0.194744,0.0140274,-0.0672637>0.0092,rgbt<1.000,0.600,0.600,0.000>,1)
VMD_cylinder(<0.394306,0.00053347,0.0506996>,<0.340898,-0.0327066,0.252971>0.0092,rgbt<1.000,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.00481898,0.0275213,-0.185227>,<-0.13035,0.00649995,-0.0796379>0.0092,rgbt<0.900,0.500,0.000,0.000>,1)
VMD_cylinder(<-0.00481898,0.0275213,-0.185227>,<-0.0127401,0.158479,-0.177205>0.0092,rgbt<0.900,0.500,0.000,0.000>,1)
VMD_cylinder(<-0.00481898,0.0275213,-0.185227>,<0.194744,0.0140274,-0.0672637>0.0092,rgbt<0.900,0.500,0.000,0.000>,1)
VMD_cylinder(<0.287489,-0.0659467,0.455242>,<0.340898,-0.0327066,0.252971>0.0092,rgbt<0.550,0.900,0.020,0.000>,1)
VMD_cylinder(<0.537936,0.34857,0.0211636>,<0.541366,0.389242,-0.114021>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.537936,0.34857,0.0211636>,<0.669694,0.343241,0.0722458>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.537936,0.34857,0.0211636>,<0.462618,0.440934,0.0960505>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.537936,0.34857,0.0211636>,<0.466121,0.174552,0.0359316>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.573332,-0.304858,-0.0761528>,<0.487315,-0.416187,-0.075556>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.573332,-0.304858,-0.0761528>,<0.617552,-0.280347,-0.208027>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.573332,-0.304858,-0.0761528>,<0.683916,-0.331277,0.00776204>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.573332,-0.304858,-0.0761528>,<0.483819,-0.152162,-0.0127266>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.801452,0.337912,0.123328>,<0.860981,0.276128,0.0691484>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.801452,0.337912,0.123328>,<0.803363,0.306332,0.219762>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.801452,0.337912,0.123328>,<0.844086,0.430698,0.120737>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.801452,0.337912,0.123328>,<0.669694,0.343241,0.0722458>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.25588,-0.0145213,0.0259511>,<-0.13035,0.00649995,-0.0796379>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.25588,-0.0145213,0.0259511>,<-0.321661,0.0750657,0.0831995>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.25588,-0.0145213,0.0259511>,<-0.303352,-0.126079,0.0562441>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.0206612,0.289437,-0.169184>,<-0.0127401,0.158479,-0.177205>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.0571801,0.278666,0.504741>,<-0.11769,0.357591,0.524514>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.387299,0.533299,0.170937>,<0.462618,0.440934,0.0960505>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.387299,0.533299,0.170937>,<0.381814,0.506839,0.268659>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.387299,0.533299,0.170937>,<0.429935,0.626009,0.166047>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.387299,0.533299,0.170937>,<0.292507,0.542228,0.136125>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.544796,0.429914,-0.249206>,<0.541366,0.389242,-0.114021>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.544796,0.429914,-0.249206>,<0.587033,0.522561,-0.257173>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.544796,0.429914,-0.249206>,<0.599308,0.366965,-0.307108>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.544796,0.429914,-0.249206>,<0.45185,0.436363,-0.289567>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.401298,-0.527516,-0.0749593>,<0.319669,-0.513355,-0.133505>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.401298,-0.527516,-0.0749593>,<0.449771,-0.610369,-0.110018>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.401298,-0.527516,-0.0749593>,<0.368852,-0.548728,0.018638>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.401298,-0.527516,-0.0749593>,<0.487315,-0.416187,-0.075556>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.661772,-0.255836,-0.339902>,<0.70872,-0.33836,-0.377552>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.661772,-0.255836,-0.339902>,<0.617552,-0.280347,-0.208027>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.661772,-0.255836,-0.339902>,<0.727992,-0.179075,-0.344457>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.661772,-0.255836,-0.339902>,<0.584677,-0.234147,-0.402387>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.7945,-0.357695,0.091677>,<0.843497,-0.441574,0.0601185>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.7945,-0.357695,0.091677>,<0.861787,-0.281798,0.0917815>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.7945,-0.357695,0.091677>,<0.765498,-0.373358,0.18762>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.7945,-0.357695,0.091677>,<0.683916,-0.331277,0.00776204>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.920509,0.214345,0.0149687>,<0.860981,0.276128,0.0691484>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.886719,0.523484,0.118146>,<0.844086,0.430698,0.120737>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.805274,0.274752,0.316196>,<0.803363,0.306332,0.219762>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.387442,0.164653,0.140448>,<-0.321661,0.0750657,0.0831995>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.387442,0.164653,0.140448>,<-0.495506,0.113125,0.204683>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.387442,0.164653,0.140448>,<-0.374249,0.295049,0.127223>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.350823,-0.237636,0.0865371>,<-0.303352,-0.126079,0.0562441>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.350823,-0.237636,0.0865371>,<-0.322108,-0.353597,0.0310577>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.350823,-0.237636,0.0865371>,<-0.44744,-0.225733,0.181558>0.0092,rgbt<0.100,0.200,0.700,0.000>,1)
VMD_cylinder(<-0.178199,0.436516,0.544287>,<-0.220698,0.498892,0.428254>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.178199,0.436516,0.544287>,<-0.256622,0.401645,0.598654>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.178199,0.436516,0.544287>,<-0.11769,0.357591,0.524514>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.178199,0.436516,0.544287>,<-0.127394,0.501518,0.602772>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<0.376329,0.480379,0.36638>,<0.381814,0.506839,0.268659>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.472571,0.718719,0.161156>,<0.429935,0.626009,0.166047>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.197714,0.551156,0.101313>,<0.292507,0.542228,0.136125>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.358905,0.442812,-0.329928>,<0.45185,0.436363,-0.289567>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.629269,0.615208,-0.26514>,<0.587033,0.522561,-0.257173>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.653821,0.304015,-0.36501>,<0.599308,0.366965,-0.307108>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.23804,-0.499194,-0.192051>,<0.319669,-0.513355,-0.133505>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.498244,-0.693221,-0.145077>,<0.449771,-0.610369,-0.110018>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.336406,-0.569939,0.112235>,<0.368852,-0.548728,0.018638>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.794212,-0.102314,-0.349011>,<0.727992,-0.179075,-0.344457>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.755668,-0.420883,-0.415202>,<0.70872,-0.33836,-0.377552>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.507581,-0.212458,-0.464872>,<0.584677,-0.234147,-0.402387>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.736496,-0.389022,0.283563>,<0.765498,-0.373358,0.18762>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.892494,-0.525453,0.02856>,<0.843497,-0.441574,0.0601185>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.929075,-0.2059,0.0918861>,<0.861787,-0.281798,0.0917815>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.361056,0.425445,0.113997>,<-0.374249,0.295049,0.127223>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.361056,0.425445,0.113997>,<-0.312127,0.493357,0.213109>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.361056,0.425445,0.113997>,<-0.40327,0.483522,0.00581875>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.60357,0.0615981,0.268919>,<-0.495506,0.113125,0.204683>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.60357,0.0615981,0.268919>,<-0.573814,-0.0761165,0.272748>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.60357,0.0615981,0.268919>,<-0.612832,0.102228,0.360996>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.60357,0.0615981,0.268919>,<-0.687845,0.0823305,0.215928>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.293393,-0.469559,-0.0244217>,<-0.329274,-0.491483,-0.147515>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.293393,-0.469559,-0.0244217>,<-0.237915,-0.562537,0.0472499>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.293393,-0.469559,-0.0244217>,<-0.322108,-0.353597,0.0310577>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.544058,-0.213831,0.276578>,<-0.623075,-0.272406,0.253139>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.544058,-0.213831,0.276578>,<-0.44744,-0.225733,0.181558>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.544058,-0.213831,0.276578>,<-0.573814,-0.0761165,0.272748>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.544058,-0.213831,0.276578>,<-0.507861,-0.242192,0.36694>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.263198,0.561268,0.312221>,<-0.220698,0.498892,0.428254>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.263198,0.561268,0.312221>,<-0.253905,0.689183,0.299049>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.263198,0.561268,0.312221>,<-0.312127,0.493357,0.213109>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.0765884,0.566521,0.661257>,<-0.127394,0.501518,0.602772>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.335045,0.366774,0.653022>,<-0.256622,0.401645,0.598654>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.445483,0.541599,-0.10236>,<-0.433329,0.669629,-0.111102>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.445483,0.541599,-0.10236>,<-0.501705,0.469122,-0.206223>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.445483,0.541599,-0.10236>,<-0.40327,0.483522,0.00581875>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.622094,0.142858,0.453072>,<-0.612832,0.102228,0.360996>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.77212,0.103063,0.162938>,<-0.687845,0.0823305,0.215928>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.365156,-0.513406,-0.270609>,<-0.337276,-0.628116,-0.322423>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365156,-0.513406,-0.270609>,<-0.329274,-0.491483,-0.147515>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.365156,-0.513406,-0.270609>,<-0.43373,-0.418961,-0.345186>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.182438,-0.655516,0.118922>,<-0.158699,-0.769188,0.0630442>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.182438,-0.655516,0.118922>,<-0.237915,-0.562537,0.0472499>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.182438,-0.655516,0.118922>,<-0.147341,-0.63476,0.251282>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.702092,-0.330981,0.2297>,<-0.623075,-0.272406,0.253139>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.471665,-0.270552,0.457302>,<-0.507861,-0.242192,0.36694>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.244613,0.817097,0.285876>,<-0.253905,0.689183,0.299049>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.244613,0.817097,0.285876>,<-0.28218,0.877786,0.1785>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.244613,0.817097,0.285876>,<-0.205256,0.870549,0.36165>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.421174,0.79766,-0.119844>,<-0.433329,0.669629,-0.111102>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.421174,0.79766,-0.119844>,<-0.370461,0.868067,-0.0243604>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.421174,0.79766,-0.119844>,<-0.452992,0.843622,-0.203673>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.557927,0.396645,-0.310085>,<-0.629641,0.332922,-0.277279>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.557927,0.396645,-0.310085>,<-0.488065,0.340202,-0.357474>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.557927,0.396645,-0.310085>,<-0.501705,0.469122,-0.206223>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.557927,0.396645,-0.310085>,<-0.599684,0.458653,-0.378187>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.309397,-0.742826,-0.374237>,<-0.335977,-0.760189,-0.469865>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.309397,-0.742826,-0.374237>,<-0.250996,-0.83603,-0.306962>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.309397,-0.742826,-0.374237>,<-0.337276,-0.628116,-0.322423>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.502305,-0.324516,-0.419762>,<-0.440069,-0.250801,-0.45143>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.502305,-0.324516,-0.419762>,<-0.544538,-0.367553,-0.500965>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.502305,-0.324516,-0.419762>,<-0.575468,-0.279928,-0.365551>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.502305,-0.324516,-0.419762>,<-0.43373,-0.418961,-0.345186>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.134959,-0.88286,0.00716681>,<-0.0900995,-0.954685,0.0617384>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.134959,-0.88286,0.00716681>,<-0.158699,-0.769188,0.0630442>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.134959,-0.88286,0.00716681>,<-0.163777,-0.906047,-0.11626>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.112245,-0.614005,0.383643>,<-0.192869,-0.621481,0.445003>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.112245,-0.614005,0.383643>,<-0.0454189,-0.683792,0.413608>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.112245,-0.614005,0.383643>,<-0.0705907,-0.522662,0.397704>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.112245,-0.614005,0.383643>,<-0.147341,-0.63476,0.251282>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.1659,0.924002,0.437423>,<-0.205256,0.870549,0.36165>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.319747,0.938475,0.0711227>,<-0.303824,1.07559,0.0577378>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.319747,0.938475,0.0711227>,<-0.28218,0.877786,0.1785>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.319747,0.938475,0.0711227>,<-0.370461,0.868067,-0.0243604>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.484809,0.889584,-0.287502>,<-0.452992,0.843622,-0.203673>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.701355,0.2692,-0.244472>,<-0.629641,0.332922,-0.277279>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.641441,0.520661,-0.446288>,<-0.599684,0.458653,-0.378187>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.418204,0.283759,-0.404863>,<-0.488065,0.340202,-0.357474>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.362558,-0.777553,-0.565493>,<-0.335977,-0.760189,-0.469865>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.192594,-0.929234,-0.239687>,<-0.250996,-0.83603,-0.306962>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.192594,-0.929234,-0.239687>,<-0.159865,-1.05024,-0.298954>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.192594,-0.929234,-0.239687>,<-0.163777,-0.906047,-0.11626>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.377833,-0.177085,-0.483098>,<-0.440069,-0.250801,-0.45143>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.586773,-0.41059,-0.582168>,<-0.544538,-0.367553,-0.500965>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.648632,-0.23534,-0.31134>,<-0.575468,-0.279928,-0.365551>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.0452395,-1.02651,0.11631>,<-0.0900995,-0.954685,0.0617384>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.273494,-0.628956,0.506363>,<-0.192869,-0.621481,0.445003>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.0214067,-0.753579,0.443573>,<-0.0454189,-0.683792,0.413608>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.0289368,-0.431318,0.411766>,<-0.0705907,-0.522662,0.397704>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.287901,1.2127,0.044353>,<-0.303824,1.07559,0.0577378>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.287901,1.2127,0.044353>,<-0.356004,1.25188,-0.0195184>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.287901,1.2127,0.044353>,<-0.296501,1.25985,0.133558>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.287901,1.2127,0.044353>,<-0.195771,1.23447,0.00754905>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.127136,-1.17125,-0.358221>,<-0.159865,-1.05024,-0.298954>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.127136,-1.17125,-0.358221>,<-0.189286,-1.19287,-0.435187>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.127136,-1.17125,-0.358221>,<-0.130708,-1.24737,-0.291525>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.127136,-1.17125,-0.358221>,<-0.0326804,-1.16824,-0.395464>0.0092,rgbt<0.350,0.350,0.350,0.000>,1)
VMD_cylinder(<-0.424106,1.29105,-0.0833899>,<-0.356004,1.25188,-0.0195184>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.3051,1.30699,0.222762>,<-0.296501,1.25985,0.133558>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.10364,1.25624,-0.0292549>,<-0.195771,1.23447,0.00754905>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<0.0617754,-1.16524,-0.432707>,<-0.0326804,-1.16824,-0.395464>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.13428,-1.32349,-0.224829>,<-0.130708,-1.24737,-0.291525>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
VMD_cylinder(<-0.251437,-1.21449,-0.512154>,<-0.189286,-1.19287,-0.435187>0.0092,rgbt<1.000,1.000,1.000,0.000>,1)
// MoleculeID: 4 ReprID: 1 Beginning CPK
// MoleculeID: 4 ReprID: 1 Beginning VDW
VMD_sphere(<0.3943,0.0005,0.0507>,0.0345,rgbt<1.000,0.600,0.600,0.000>)
// End of POV-Ray 3.x generation 

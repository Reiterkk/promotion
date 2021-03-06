// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/ce.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/ce.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/ce.pov.tga +P +X +A +FT +C
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
VMD_sphere(<0.0144,0.0993,0.1090>,0.0510,rgbt<0.900,0.900,0.300,0.000>)
VMD_sphere(<0.4622,-0.8617,0.0089>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<1.1639,-0.8759,0.0329>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.1828,-1.3596,-0.4188>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.0218,-0.5874,0.5022>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<1.2516,-0.2238,0.2459>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.5033,-1.3612,-0.2736>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.5735,-0.8893,0.2485>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<1.9116,0.0272,0.3614>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.7440,0.2726,0.3361>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<1.8313,0.7238,0.4025>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<1.4821,0.7518,-0.1773>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<1.1403,0.7411,-0.7588>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-1.2089,-0.8141,0.5329>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.6038,0.5139,-0.3756>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-1.2042,-0.1251,0.4610>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.3517,-0.1950,-0.5440>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.0204,0.8598,-0.1398>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-1.8542,0.1842,0.4954>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.6879,0.3468,0.3533>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.3462,-0.1958,-0.5288>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.5564,0.5168,-0.3984>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-1.7338,0.8729,0.4372>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-1.4080,0.8240,-0.1559>,0.0395,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-1.1054,0.7548,-0.7560>,0.0526,rgbt<0.700,0.350,0.000,0.000>)
VMD_cylinder(<0.462197,-0.861668,0.00890159>,<0.322518,-1.11064,-0.20496>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.462197,-0.861668,0.00890159>,<0.241985,-0.72453,0.255573>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.462197,-0.861668,0.00890159>,<0.813024,-0.868768,0.0209029>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.16385,-0.875869,0.0329042>,<1.20771,-0.549836,0.139398>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.16385,-0.875869,0.0329042>,<0.813024,-0.868768,0.0209029>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.182838,-1.35962,-0.418822>,<-0.160253,-1.36041,-0.346217>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.182838,-1.35962,-0.418822>,<0.322518,-1.11064,-0.20496>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0217731,-0.587391,0.502245>,<-0.275867,-0.738338,0.375353>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0217731,-0.587391,0.502245>,<0.241985,-0.72453,0.255573>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.25157,-0.223804,0.245892>,<0.997777,0.0244068,0.290989>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.25157,-0.223804,0.245892>,<1.20771,-0.549836,0.139398>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.25157,-0.223804,0.245892>,<1.5816,-0.0983179,0.30367>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.503343,-1.36121,-0.273613>,<-0.538425,-1.12525,-0.0125758>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.503343,-1.36121,-0.273613>,<-0.160253,-1.36041,-0.346217>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.573507,-0.889284,0.248461>,<-0.275867,-0.738338,0.375353>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.573507,-0.889284,0.248461>,<-0.538425,-1.12525,-0.0125758>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.573507,-0.889284,0.248461>,<-0.891217,-0.851693,0.390661>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.91162,0.0271681,0.361449>,<1.5816,-0.0983179,0.30367>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.91162,0.0271681,0.361449>,<1.87149,0.375499,0.381998>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.743986,0.272617,0.336086>,<0.997777,0.0244068,0.290989>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.743986,0.272617,0.336086>,<0.67388,0.393245,-0.0197501>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.83135,0.723829,0.402548>,<1.65674,0.737803,0.112604>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.83135,0.723829,0.402548>,<1.87149,0.375499,0.381998>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.48213,0.751776,-0.17734>,<1.31121,0.746417,-0.468058>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.48213,0.751776,-0.17734>,<1.65674,0.737803,0.112604>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.14028,0.741058,-0.758775>,<0.872028,0.627466,-0.567181>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.14028,0.741058,-0.758775>,<1.31121,0.746417,-0.468058>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.20893,-0.814102,0.53286>,<-0.891217,-0.851693,0.390661>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.20893,-0.814102,0.53286>,<-1.20658,-0.469621,0.496922>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.603774,0.513874,-0.375587>,<0.312083,0.686845,-0.257705>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.603774,0.513874,-0.375587>,<0.477728,0.159455,-0.45981>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.603774,0.513874,-0.375587>,<0.67388,0.393245,-0.0197501>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.603774,0.513874,-0.375587>,<0.872028,0.627466,-0.567181>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.20423,-0.125139,0.460983>,<-1.20658,-0.469621,0.496922>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.20423,-0.125139,0.460983>,<-1.52924,0.0295211,0.478198>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.20423,-0.125139,0.460983>,<-0.946083,0.110815,0.407137>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.351682,-0.194963,-0.544033>,<0.477728,0.159455,-0.45981>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.351682,-0.194963,-0.544033>,<0.00276265,-0.195386,-0.536427>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0203924,0.859817,-0.139823>,<-0.267989,0.688319,-0.269118>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0203924,0.859817,-0.139823>,<0.312083,0.686845,-0.257705>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.85425,0.184182,0.495412>,<-1.52924,0.0295211,0.478198>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.85425,0.184182,0.495412>,<-1.79403,0.528526,0.466294>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.687933,0.346768,0.353292>,<-0.946083,0.110815,0.407137>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.687933,0.346768,0.353292>,<-0.622151,0.431795,-0.0225611>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.346156,-0.195809,-0.528821>,<-0.451263,0.160506,-0.463617>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.346156,-0.195809,-0.528821>,<0.00276265,-0.195386,-0.536427>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.55637,0.516821,-0.398414>,<-0.451263,0.160506,-0.463617>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.55637,0.516821,-0.398414>,<-0.267989,0.688319,-0.269118>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.55637,0.516821,-0.398414>,<-0.83088,0.63581,-0.57723>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.55637,0.516821,-0.398414>,<-0.622151,0.431795,-0.0225611>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.73382,0.87287,0.437177>,<-1.79403,0.528526,0.466294>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.73382,0.87287,0.437177>,<-1.57089,0.848445,0.140614>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.40797,0.82402,-0.155948>,<-1.57089,0.848445,0.140614>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.40797,0.82402,-0.155948>,<-1.25668,0.789409,-0.455997>0.0128,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.10539,0.754798,-0.756046>,<-1.25668,0.789409,-0.455997>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.10539,0.754798,-0.756046>,<-0.83088,0.63581,-0.57723>0.0128,rgbt<0.700,0.350,0.000,0.000>,1)
// End of POV-Ray 3.x generation 

// 
// Molecular graphics export from VMD 1.9.1
// http://www.ks.uiuc.edu/Research/vmd/
// Requires POV-Ray 3.5 or later
// 
// POV 3.x input script : E:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/hg8te16_top.pov 
// try povray +W1920 +H1057 -IE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/hg8te16_top.pov -OE:/Users/Kevin Reiter/Documents/GitHub/promotion/daten/porph/hg8te16_top.pov.tga +P +X +A +FT +C
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
VMD_sphere(<0.3236,0.8177,0.0582>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.7702,0.7766,0.0801>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.2149,1.2678,0.0685>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.0091,0.5256,0.0308>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.8052,0.3301,0.0572>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.2337,1.2679,0.0554>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.3422,0.8179,0.0390>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<1.2531,0.2239,0.1158>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.5207,-0.0038,-0.0054>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<1.2617,-0.2229,0.0737>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.8187,-0.3327,-0.0043>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.7903,-0.7765,-0.0652>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.7891,0.7827,0.0386>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.3442,-0.8205,-0.0626>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.8253,0.3368,-0.0007>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<0.2358,-1.2701,-0.0736>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<0.0111,-0.5279,-0.0535>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-1.2706,0.2167,-0.0173>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.5204,0.0144,-0.0224>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.2131,-1.2703,-0.0774>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.3218,-0.8208,-0.0670>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-1.2556,-0.2306,-0.0510>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_sphere(<-0.8005,-0.3278,-0.0470>,0.0252,rgbt<0.600,0.600,0.600,0.000>)
VMD_sphere(<-0.7681,-0.7744,-0.0700>,0.0335,rgbt<0.700,0.350,0.000,0.000>)
VMD_cylinder(<0.323649,0.817715,0.0582303>,<0.26925,1.04277,0.0633618>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.323649,0.817715,0.0582303>,<0.157281,0.671648,0.0444996>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.323649,0.817715,0.0582303>,<0.546918,0.797177,0.0691743>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.770186,0.776639,0.0801183>,<0.546918,0.797177,0.0691743>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.770186,0.776639,0.0801183>,<0.787711,0.55337,0.0686791>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.214852,1.26782,0.0684934>,<0.26925,1.04277,0.0633618>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.214852,1.26782,0.0684934>,<-0.00943753,1.26786,0.0619656>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.00908828,0.525581,0.0307689>,<0.157281,0.671648,0.0444996>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.00908828,0.525581,0.0307689>,<-0.175654,0.671745,0.0348688>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.805236,0.330102,0.0572397>,<0.787711,0.55337,0.0686791>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.805236,0.330102,0.0572397>,<1.02916,0.276994,0.086503>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.805236,0.330102,0.0572397>,<0.662982,0.163151,0.0259015>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.233727,1.26791,0.0554379>,<-0.287974,1.04291,0.0472034>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.233727,1.26791,0.0554379>,<-0.00943753,1.26786,0.0619656>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.342221,0.817909,0.0389689>,<-0.175654,0.671745,0.0348688>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.342221,0.817909,0.0389689>,<-0.287974,1.04291,0.0472034>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.342221,0.817909,0.0389689>,<-0.565638,0.800324,0.0387857>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<1.25309,0.223886,0.115766>,<1.02916,0.276994,0.086503>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.25309,0.223886,0.115766>,<1.25739,0.000506711,0.0947358>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.520728,-0.00379872,-0.00543681>,<0.662982,0.163151,0.0259015>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.520728,-0.00379872,-0.00543681>,<0.669706,-0.168258,-0.00488742>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.2617,-0.222872,0.0737053>,<1.04019,-0.277795,0.0346836>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<1.2617,-0.222872,0.0737053>,<1.25739,0.000506711,0.0947358>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.818686,-0.332717,-0.00433804>,<0.669706,-0.168258,-0.00488742>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.818686,-0.332717,-0.00433804>,<1.04019,-0.277795,0.0346836>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.818686,-0.332717,-0.00433804>,<0.804507,-0.554587,-0.0347628>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.790329,-0.776457,-0.0651876>,<0.804507,-0.554587,-0.0347628>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.790329,-0.776457,-0.0651876>,<0.567254,-0.798465,-0.0638691>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.789055,0.782739,0.0386026>,<-0.807163,0.559752,0.0189726>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.789055,0.782739,0.0386026>,<-0.565638,0.800324,0.0387857>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.34418,-0.820472,-0.0625507>,<0.567254,-0.798465,-0.0638691>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.34418,-0.820472,-0.0625507>,<0.177656,-0.674166,-0.0580112>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.34418,-0.820472,-0.0625507>,<0.289971,-1.04528,-0.0680959>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.82527,0.336765,-0.000657423>,<-0.672832,0.175598,-0.011515>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.82527,0.336765,-0.000657423>,<-1.04796,0.276719,-0.008993>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.82527,0.336765,-0.000657423>,<-0.807163,0.559752,0.0189726>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<0.235761,-1.27009,-0.0736411>,<0.289971,-1.04528,-0.0680959>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.235761,-1.27009,-0.0736411>,<0.0113481,-1.27021,-0.0755279>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0111317,-0.52786,-0.0534717>,<0.177656,-0.674166,-0.0580112>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<0.0111317,-0.52786,-0.0534717>,<-0.155336,-0.674313,-0.0602158>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.27065,0.216673,-0.0173286>,<-1.04796,0.276719,-0.008993>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.27065,0.216673,-0.0173286>,<-1.26314,-0.00697111,-0.0341619>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.520393,0.0144304,-0.0223725>,<-0.660464,-0.156686,-0.0346718>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.520393,0.0144304,-0.0223725>,<-0.672832,0.175598,-0.011515>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.213065,-1.27034,-0.0774148>,<-0.267435,-1.04555,-0.0721873>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.213065,-1.27034,-0.0774148>,<0.0113481,-1.27021,-0.0755279>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.321804,-0.820766,-0.0669598>,<-0.155336,-0.674313,-0.0602158>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.321804,-0.820766,-0.0669598>,<-0.267435,-1.04555,-0.0721873>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.321804,-0.820766,-0.0669598>,<-0.54494,-0.797571,-0.0684829>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-1.25564,-0.230616,-0.0509953>,<-1.26314,-0.00697111,-0.0341619>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-1.25564,-0.230616,-0.0509953>,<-1.02809,-0.279209,-0.0489832>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.800535,-0.327802,-0.046971>,<-0.784306,-0.551089,-0.0584885>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.800535,-0.327802,-0.046971>,<-0.660464,-0.156686,-0.0346718>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.800535,-0.327802,-0.046971>,<-1.02809,-0.279209,-0.0489832>0.0081,rgbt<0.600,0.600,0.600,0.000>,1)
VMD_cylinder(<-0.768076,-0.774377,-0.0700061>,<-0.54494,-0.797571,-0.0684829>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
VMD_cylinder(<-0.768076,-0.774377,-0.0700061>,<-0.784306,-0.551089,-0.0584885>0.0081,rgbt<0.700,0.350,0.000,0.000>,1)
// End of POV-Ray 3.x generation 

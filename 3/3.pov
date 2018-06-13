#include "colors.inc" 
#include "functions.inc"  
#include "woods.inc"
#declare T0 = texture { T_Wood19 }
 
      

// PoVRay  3.7 Scene File " ... .pov"
// author:   ...  
// date:   ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
// adding a photon{} block to global_settings activates photon mapping.
// photons also need to be adjusted for light sources and objects.
global_settings {
  photons {
    spacing 0.01                 // specify the density of photons
    //count 100000               // alternatively use a total number of photons

    //gather min, max            // amount of photons gathered during render [20, 100]
    //media max_steps [,factor]  // media photons
    //jitter 1.0                 // jitter phor photon rays
    //max_trace_level 5          // optional separate max_trace_level
    //adc_bailout 1/255          // see global adc_bailout
    //save_file "filename"       // save photons to file
    //load_file "filename"       // load photons from file
    //autostop 0                 // photon autostop option
    //radius 10                  // manually specified search radius
    // (---Adaptive Search Radius---)
    //steps 1
    //expand_thresholds 0.2, 40
  }
}
//---------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ---------------------------------------------------------------------
light_source{<1500,2500, -500> color White
// photon block for a light source
  photons {
    refraction on
    reflection on
    //area_light
  }
}
// sky ---------------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }
// sea ---------------------------------------------------------------------
difference{ 
plane{ <0,1,0>, 0 } 
box{ <-3,-1,-3>,<3,0.1,3> }

       texture{ Polished_Chrome
                normal { bumps 1.75 scale 0.2 turbulence 0.25 } 
                finish { reflection 0.60}
                scale  3
              }
  photons{
    collect off       // ignore photons
  }

} 
box{ <-3,-1,-3>,<3,0,3>
       texture{ Polished_Chrome
                normal { bumps 1.75 scale 0.2 turbulence 0.25 } 
                finish { reflection 0.60}
                scale  3
              }
// photon block for an object
  photons{
    target 1.0          // spacing multiplier for photons hitting the object
   // refraction on
    reflection on
    //collect off       // ignore photons
    //pass_through      // do not influence photons
  }
               
     }

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------

   
   
   

background{   rgb<0.2,0.2,0.4> }        
 
 /*
  cylinder {
        0, 10*x, 0.03
        pigment { Red }
        } 

        cylinder {
        0, 10*y, 0.03
         pigment { Green }
        } 

        cylinder {
        0, 10*z, 0.03
        pigment { Blue }
        }   

          */
//----------------------------------------------------

union {         

 
prism{   -0.5,0,4   <5,5>,<-5,5>,<-5,-5>,<5,-5>  
   //      pigment {      checker  Black  White   
     //                   scale .5    }
                        
                        
          texture { T0}   }     
                                              


union {
       //голова     

    isosurface{
      function {  f_rounded_box(x,y,z,0,1,1,1 )
        - f_superellipsoid( x,y,z, 1.0, 0.45)
       }
      threshold 0
      contained_by {box { -1 , 1 }}
      max_gradient 10
      accuracy 0.005
      open  
    
      texture {
        //pigment{color rgb<1,0.15,0.9>} 
        pigment{White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <1,0.7,0.9>*1
      rotate <0,0,0>
      translate <0,7,0>
    }                                             
    
    //-------------------------------------------
    //---------------------тело----------------
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
                 + sin(0.5*sin(y*4))*0.1 }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{color rgb<1,0.15,0.9>}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.80,1.00,0.80> *3.4
      rotate <0,0,0>
      translate <0,4,0>
    }        
    
    
    
    //-------------------------------------------
    //---------------------глаза----------------
    
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) -0.5}
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{Black}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale 0.2
      rotate <0,0,0>
      translate <0.9,7.3,0.3>
    }                                    
    
    //-------------------------------------------
    //---------------------глаза----------------
        
        isosurface{
          function { sqrt(x*x + y*y + z*z) -0.5 }
          threshold 0
          accuracy 0.0001
          max_gradient 5
          contained_by{box{ -1, 1 }}
         texture {
            pigment{Black}
            finish { specular 0.2 phong 0.7 reflection 0.1}
          }
          scale 0.2
          rotate <0,0,0>
          translate <0.9,7.3,-0.3>
        } 
                                   
                                   
    //-------------------------------------------
    //---------------------ноги----------------
     isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8}
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } // end of texture
      scale <0.8,1.00,0.7> *1.4
      rotate <10,0,0>
      translate <0,1,-1>
    } // end of isosurface ----------------



     //-------------------------------------------
    //---------------------ноги----------------

     isosurface{ //-------------------------
      function { sqrt(x*x + y*y + z*z) - 0.8}
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.00,0.7> *1.4
      rotate <-10,0,0>
      translate <0,1,1>
    } 
         
    union {
    //рука права€ 
    
     isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
              }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      }
      scale <0.8,1.50,0.7> *1.4
      rotate <45,0,0>
      translate <0,4,-3>
    } 
    

    //пальцы рук
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
              }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <35,0,0>
      translate <0.5,2.7,-3.7>
    } 
    


    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
                 }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      }
      scale <0.8,1.70,0.7> *0.4
      rotate <40,0,0>
      translate <0.5,2.7,-4.25>
    } 
    
    
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
                  }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      }
      scale <0.8,1.70,0.7> *0.4
      rotate <55,0,0>
      translate <0.5,3,-4.45>
    } 
    
      
    isosurface{
      function { sqrt(x*x + y*y + z*z) - 0.8
                 }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <75,0,0>
      translate <0.5,3.4,-4.55>
    } 
    
      scale 1
      rotate <0,180,180>
      translate <0.5,10.4,-1>
      
       } 
    
    }  
    union {
    //рука права€ 
    
     isosurface{ 
        function { sqrt(x*x + y*y + z*z) - 0.8
                   }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.50,0.7> *1.4
      rotate <45,0,0>
      translate <0,4,-3>
    } 
    
    
    //пальцы рук
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
                 }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <35,0,0>
      translate <0.5,2.7,-3.7>
    } 
    
    
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8 }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <40,0,0>
      translate <0.5,2.7,-4.25>
    } 
    
    
    
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8}
      
        threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <55,0,0>
      translate <0.5,3,-4.45>
    } 
    
      
    isosurface{ 
      function { sqrt(x*x + y*y + z*z) - 0.8
            }
      threshold 0
      accuracy 0.0001
      max_gradient 5
      contained_by{box{ -1, 1 }}
     texture {
        pigment{ White}
        finish { specular 0.2 phong 0.7 reflection 0.1}
      } 
      scale <0.8,1.70,0.7> *0.4
      rotate <75,0,0>
      translate <0.5,3.4,-4.55>
    } 
    
    
      scale 1
    
        rotate <0,0,0>
      translate <0.5,0.6,0.5>
       } 
                                   
  translate <0,0.7,0>
}



              

/*------------------------камера--------------------*/


camera {
        angle 80 //угол обзора камеры 80 градусов
        location 1.8*<9.5,4,0> //расположение камеры
        look_at <2.5,0,2.5> //камера смотрит в точку 0 0 0
}                         
/*           
camera { location  <10, 7, 3> look_at <0, 0, 0>}
light_source {<-100,200,-100> colour rgb 1} 
  */
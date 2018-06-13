
#version 3.7;
global_settings { assumed_gamma 1.2 } 

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"
        
       
                                
                                
                                
                                
                                
                                
                                
                                
//----стены зеркальные ( и под углом 45) из-за этого создаетс иллюзия что несколько столов  
// по факту 1 стол с террариумом со стеклами такой странной формы    













    
        
//цвет заднего фона
background {rgb <0.2,0.2,0.4>
}    
        
        
//камера        
camera {
        angle 80 //угол обзора камеры 80 градусов
        location <10,10,-3> //расположение камеры
        look_at <2,2,2> //камера смотрит в точку 0 0 0
}       

//свет       
light_source {  <10,30,-3>  
               color White   }  

               
//координаты осей                
              
cylinder {  0, 10*x, 0.03 
            pigment {  Red }  }    
                                   
cylinder {  0, 10*y, 0.03 
            pigment {  Green }   }
             
 
cylinder {  0, 10*z, 0.03 
            pigment {  Blue }    }    

  
//пол               
prism{   -0.5,0,4  
         <15,15>,<-15,15>,<-15,-15>,<15,-15>
             
        //шахматная закраска, 2 клетки = 1 ед. отрезок
        pigment {
            checker  Black  White   
            scale .5    }  }         
          
union{      
          
#macro HOME (pos_x, pos_y, pos_z )
                                     
merge{ 

//дом-----

difference{
            
            box{
            <0,0,0>
            <7,5,7>
            
            pigment{marble}
            }
             
            box{
            <0.1,0.2,0.1>
            <6.9,5.1,6.9>
            
            pigment{Apocalypse}
            }       

               box{
            <4.9,0.2,1.5>
            <7.1,4.0,4.5>
            
            pigment{Apocalypse}
            }   
             
            box{
            
            <2,2,-0.01>
            <4,4,0.2>
            
            pigment{Apocalypse}
            }
            
            box{
            
            <1,2,4.9>
            <6,4,7.1>
            
            pigment{Apocalypse}
            }
 
      
 
  }   
  
//--------- забор--------------   
  
difference{
        box{
            <-5,0,-8>
            <11,3,10>
            
            pigment{checker Yellow Orange}
        }    
        
        box{
            <-4.85,0,-7.85>
            <10.85,4,9.85>
            
            pigment{checker Yellow Black}
        }
    }   
    
          
//---dverrr----
 box{
            <8.9,0.2,1.5>
            <9.0,4.0,4.5>
            
            pigment{DMFWood1}   
             rotate<0,-15,0> 
             translate<-0.5,0,-2>
         
            }     
            
            
//----doroga----------            
  box{
            <7.0,0.2,1.5>
            <10.85,0.3,4.5>
            
            pigment{Candy_Cane}   
          
         
            } 


//--travaaa--------- 
box{
    <-4.85,0,-7.85>
    <10.85,0.01,9.85>
    
    pigment{ Jade }
}    

//стекла  
   
box{

    <2,2,0>
    <4,4,0.1>
    
    pigment{rgbf <1,1,1,0.7>}
}

box{
        <1,2,6.9>
        <6,4,7.0>

        pigment{rgbf <1,1,1,0.7>}
}   
        
        
        
//Стол
union{
    box{
    
        <0,0,0>
        <0.2,1,0.2>
        
        pigment {Y_Gradient}
    } 
    
    box{
    
    <0.8,0,0>
    <1,1,0.2>
    
    pigment {Y_Gradient}
    } 
    
    box{
    
    <0.8,0,0.8>
    <1,1,1>
    
    pigment {Y_Gradient}
    } 
    
    box{
    
    <0,0,0.8>
    <0.2,1,1>
    
    pigment {Y_Gradient}
    }        
          
    box{
    
    <0,0.9,0>
    <1,1.1,1>
    
    pigment {Y_Gradient}
    }   
    translate<3.0,0.1,3.0>
    
 }     
   
//источник света

union{

    box{
    
    <4.35,0,4.35>
    <4.65,1.5,4.65>
    
    pigment{Violet}
    }  
    
    sphere{
    <4.50,2,4.50>,0.45
    
    pigment{rgbf<1,1,1,0.8>} 
    interior { ior 1}  
    
    } 
    
    
    light_source {
    <4.50,3,4.50> //источник света
    color 1 //белого цвета
    }

} 


// бублик на столе
torus{
        0.12, 0.05
        pigment{Blue_Sky2}
        translate<0.5,1.2,0.5>  

}       


 
 
 
//крыша смещенная вбок для росмотра предметов дома  
 
 
prism{
    2,6,3
    <0,0>,<0,8>, <2,2>
    pigment {Red}
    rotate<0,0,90>     
    translate<6,6,0>
}       

cylinder{
        <0.5,3,4>,
        <0.5,4.8,4>,
        0.25             
        pigment {Yellow}      
        translate<0.5,4.0,0>
}             


  translate <pos_x,pos_y,pos_z>   
///  scale <1,1,1>
   }
#end   

      
 #macro cylin (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x, pos_y, pos_z>,
        <pos_x, pos_y + h, pos_z>,
          n           
        pigment {Yellow}      
}       
 
 #end 
 
  #macro cylinder_2 (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x+h, pos_y, pos_z-h>,
        <pos_x, pos_y, pos_z>,
          n           
        pigment {Yellow}      
}       
 
 #end  
 
   #macro cylinder_3 (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x-h, pos_y, pos_z-h>,
        <pos_x, pos_y, pos_z>,
          n           
        pigment {Yellow}      
}       
 
 #end  
 
  #macro cylinder_4 (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x, pos_y, pos_z-h>,
        <pos_x, pos_y, pos_z>,
          n           
        pigment {Yellow}      
}       
 
 #end        
  
  #macro cylinder_5 (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x-h, pos_y, pos_z>,
        <pos_x, pos_y, pos_z>,
          n           
        pigment {Yellow}      
}       
 
 #end       
  
  
#macro sphere_temp (pos_x, pos_y, pos_z , d) 
  sphere{                               //оставляем тонкую выпуклость
      <pos_x, pos_y, pos_z>, d
     pigment {Yellow} 
    }  
 
 #end

 
 cylin (11,2,11,14,1)
 
 cylin (-11,2,-11,14,1)
  
 cylin (-11,2,11,14,1)
  
 cylin (11,2,-11,14,1)
     
 cylin (11,2,11,14,1)
                           
 cylinder_2 (-11,2,11,22,1)
 
 cylinder_2 (-11,16,11,22,1)
 
  cylinder_3 (11,2,11,22,1)
 
 cylinder_3 (11,16,11,22,1)
                            
  cylinder_4(11,2,11,22,1)
 
 cylinder_4 (11,16,11,22,1)
  
  cylinder_4(-11,2,11,22,1)
 
 cylinder_4 (-11,16,11,22,1) 
 
                             
  cylinder_5(11,2,11,22,1)
 
 cylinder_5 (11,16,11,22,1)
  
  cylinder_5(11,2,-11,22,1)
 
 cylinder_5 (11,16,-11,22,1)
 
 sphere_temp   (11,16,-11,1) 
  
 sphere_temp   (-11,16,-11,1)
 
 sphere_temp   (11,16,11,1)
    
 sphere_temp   (-11,16,11,1)  
 
 
 sphere_temp   (11,2,-11,1) 
  
 sphere_temp   (-11,2,-11,1)
 
 sphere_temp   (11,2,11,1)
    
 sphere_temp   (-11,2,11,1)
 
                              
HOME (0 , 3 , -1 )




  //стекло
 #macro box_temp (pos_x, pos_y, pos_z , d) 
box{

    <pos_x, pos_y, pos_z>
    <pos_x, pos_y+14, -pos_z>    
    
    
    pigment{rgbf <1,1,1,0.7>}
}  
                            
  #end
       box_temp (11,2,11,2)
            
       box_temp (-11,2,11,2)
  
       box_temp (11,2,-11,2)
  
       box_temp (-11,2,-11,2)

 //верхнее стекло
box{

    <-11, 16, -11>
    <11, 16, 11>
    
    pigment{rgbf <1,1,1,0.7>}  
    
    
              
              
    }   
        scale 0.5   
        translate<-7.5,1.2,-8.5> 
}  
      
          
          
//--------------------------------------------          
 
      
light_source {
     <20,30,-3>                               
     color White
    }

   

    prism{
      -0.5,0,4
      <16,16>,<-16,16>,<-16,-16>,<16,-16>
      pigment {rgbf <0, 0, 0, 1>}              //   <1, 1, 0, 1>   <0, 0, 0, 1>
      finish {
        reflection {
               0.01
             metallic 0.5 
        }

        phong 0.4 
        phong_size 10 
      }    
     
     }
     
 #macro nog (pos_x, pos_y, pos_z )
                                     

    box{
    
    <pos_x, pos_y, pos_z>
    <pos_x-1, pos_y-5, pos_z-1>
    
      pigment {rgbf <0, 0, 0, 1>}              //   <1, 1, 0, 1>   <0, 0, 0, 1>
      finish {
        reflection {
               0.01
             metallic 0.5 
        }

        phong 0.4 
        phong_size 10 
      }    
       
 }    
 
#end        
     
nog(16,-0.1,16)
nog(-15,-0.1,-15)  
nog(-15,-0.1,16)
nog(16,-0.1,-15)
          

box{

    <-35, -5.1, -35>
    <35, -30, 35>
    pigment { color rgb <.2,.21,.2>}
	 finish {
		 specular .1
		 roughness .003
	 }
	 normal {
		 crackle
		 bump_size -1
	 }          
                  rotate<0,45,0>
}  
  

   
 box{

 <38, -5.1, 36>
     <34, 40, -34>
    
 pigment{ color rgb <.96,.98,1> }
	 finish {
		 diffuse .01
		 ambient 0
		 specular .9
		 roughness .01
		 metallic
		 reflection { .9 metallic }
	 }
  rotate<0,45,0>       
  }     
     
     
     
     
     



box{

    <-38, -5.1, -36>
    <-34, 40, 34>
    
pigment{ color rgb <.96,.98,1> }
	  
	 finish {
		 diffuse .01
		 ambient 0
		 specular .9
		 roughness .01
		 metallic
		 reflection { .9 metallic }
	 }
  rotate<0,45,0>       
  }        
  
  
box{

    <-36, -5.1, -36>
    <34, 40, -34>  
    //pigment{ color rgb <.96,.98,1> }
	 pigment {        //????????????? ???????? (2 ??? 3 ?????)         
	  hexagon  0.5*Green  0.1*Red 0.5*Blue   scale .5    } 
	  finish {
		 diffuse .01
		 ambient 0
		 specular .9
		 roughness .01
		 metallic
		 reflection { .9 metallic }
	 }
  rotate<0,45,0>      
  }  
  
  
//-----------------калик ----------------   
   


 union{      
        

  #macro trubka (pos_x, pos_y, pos_z, h, n )  
     
cylinder{
        <pos_x, pos_y+h, pos_z>,
        <pos_x, pos_y, pos_z>,
          n           
        pigment {Black}      
}       
 
 #end         
 
 
 trubka (0,2,0,18,0.4) 
 
                                   
 
difference  {       
     lathe {         cubic_spline 
            8                        
              <-1,1>, <0, 1>, <3, 1>, <3,2>, <4, 2>, <4, 0>, <0, 0>, <-1, 0>           
                scale 0.7        }    
                    cylinder {          <5,1,0>, <-5,1,0>, 0.2               }  
                         cylinder {          <5,1,0>, <-5,1,0>, 0.2          
                          rotate 90*y              }              
                           pigment {Black}              
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

       }  translate<0,20,0>    }
        
 union{      
        
difference  {       
     lathe {         cubic_spline 
           8                      
              <-1,8>, <0.6, 8>, <0.7, 8>, <0.6,4>, <2, 2>, <2, 0>, <0, 0>, <-1, 0>           
                scale 1.4       }    
                    cylinder {          <5,1,0>, <-5,1,0>, 0.2               }  
                         cylinder {          <5,1,0>, <-5,1,0>, 0.2          
                          rotate 90*y              }              
                            pigment {color rgbf<1,0,0,0.99>}        
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

       }  translate<0,0,0>  
       
               
       } 
          
difference  { difference  {       
     lathe {         cubic_spline 
           8                      
              <-1,8>, <0.6, 8>, <0.7, 8>, <0.6,4>, <2, 2>, <2, 0>, <0, 0>, <-1, 0>           
                scale 1.399       }    
                    cylinder {          <5,1,0>, <-5,1,0>, 0.2               }  
                         cylinder {          <5,1,0>, <-5,1,0>, 0.2          
                          rotate 90*y              }              
                                 pigment {rgbf <0, 0.7, 1, 1>} 
        interior {ior 1.01}         
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

      
                  }      }
        box{

    <-3, 12, -3>
    <3, 2, 3>
    
                     pigment {rgbf <0, 0.7, 1, 1>} 
        interior {ior 1.01} 
               
       } 
                    }   
     
       //трубка
cylinder{
        <0, 5, 0>,
        <0, 8, 0>,
          0.5          
      pigment {color rgbf<1,0,0,0.8>}        
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

       }     rotate<30,0,0>  
        translate<1,-1,-2>   
        
        }
            //трубка
        
 cylinder{
        <0, 5, 0>,
        <0, 7, 0>,
          0.3           
      pigment {color rgbf<1,0,0,0.8>}        
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

       }     rotate<-30,0,0>  
        translate<-1,0,2>  
}        
              
 box{

    <0, 21.1, 0>
    <0.8,21.8, 0.8>     
    
    
    pigment{Red_Marble}
     rotate<0,140,0>   translate<-0.4,0,-0.3>
       
}                
 box{

    <0, 21.1, 0>
    <0.8,21.8, 0.8>     
    
    
    pigment{Red_Marble}
     rotate<0,20,0>   translate<0.8,0,0.9>
       
}
       
            
                   
                              box{

    <0, 21.1, 0>
    <0.8,21.8, 0.8>    
    
    
    pigment{Red_Marble}
}   

                        
  }                                    
          
     
          
difference  {       
     lathe {         cubic_spline 
           7                      
              <-1,10>, <0, 10>, <0.3, 9>, <0.6,9>, <0.3, 8>, <0, 8>, <-1, 8>           
                scale 1.4       }    
                    cylinder {          <5,1,0>, <-5,1,0>, 0.2               }  
                         cylinder {          <5,1,0>, <-5,1,0>, 0.2          
                          rotate 90*y              }              
                           pigment {Black}      
                            interior { 
                                      ior 1.5           }  
                                         finish {         
                                       reflection {         
                                           0.03           
                                                                                            }                     phong 1 
                                                             phong_size 30  
                                                        

       }  translate<0,0,0>    }         
       
       
       
    sphere{                               //оставляем тонкую выпуклость
      <0,14 , 0>, 0.7  
      pigment {Black} 
    }  
      
         
    sphere{                               //оставляем тонкую выпуклость
      <0,14.5 , 0>, 0.5  
      pigment {Black} 
    }  
       
                     
    sphere{                               //оставляем тонкую выпуклость
      <0,13.5 , 0>, 0.5  
      pigment {Black} 
    }  
       
       
       
        
  sphere_sweep{       
  b_spline, 12
   //аппроксимация  Би-сплайнами  
   // <-5,-4,-2.5>, .2
   // <5,9,4>, .2
    <3,3,-3.5>, .2
    
   <1,3,3.9>, .2
    <-1,19,-1>, .2
       
  
      
  
    <2,12,-3>, .2
    <3,10,-3>, .2
    <4,6,4>, .2    
    <2,3,4>,.2    
    <3 ,0,-1>,.2     
    <15 ,2,15>,.3     
    <-15 ,2, 15>,.2   
    <-15 ,2, 15>,.1
    <15 ,2, 15>,.01   
                pigment {Black} 
           
                     
                     
 }
 
 translate<0,0.6,0>    
  rotate<0,95,0>  
  
        
  }
                       
  
   box{

    <-16, 0.5, -16>
    <16,-0.5, 16>     
    
    
    pigment{Blue_Agate}
     rotate<0,0,0>
     
               

              
     
  }          
  
  
   //----------------1 вариант камеры --------------------------//
     
  /*             
//камера             
camera {
        angle 80 //угол обзора камеры 80 градусов
        location 3.8*<7.5,6.5,10.5> //расположение камеры
        look_at <2.5,0,2.5> //камера смотрит в точку 0 0 0
}     
      
   */                                                            
   
   
   //----------------2 вариант камеры --------------------------//
    camera {
        angle 80 //угол обзора камеры 80 градусов
        location 4.8*<7.5,6.5,4.5> //расположение камеры
        look_at <2.5,0,2.5> //камера смотрит в точку 0 0 0
}     
                         
                                  
    
                           
//----стены зеркальные ( и под углом 45) из-за этого создаетс иллюзия что несколько столов  
// по факту 1 стол с террариумом со стеклами такой странной формы   , так же  кальян с водой внутри и уже готов ) кек 












       
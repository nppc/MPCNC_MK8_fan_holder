$fn=20;

//airduct_short_print();
airduct_long_print();

/*
main_frame();
bolt_tighter();
fanmountinghole();mirror([1,0,0])fanmountinghole();

nozzle();
translate([45,-20,-2])rotate([0,-90,0])ductedfan();
translate([-50,-20,-54])rotate([0,90,0])ductedfan();

translate([37.5,-22,-12])airduct_short(-20,0);
translate([-42.5,-22,-44])airduct_long(-20,0);
*/

module main_frame(){

    difference(){
        hull(){
            translate([-23.8,-23.8,0])cylinder(d=1.5,h=18);
            translate([23.8,-23.8,0])cylinder(d=1.5,h=18);
            translate([23.8,29,0])cylinder(d=1.5,h=18);
            translate([19,34,0])cylinder(d=1.5,h=18);
            translate([-19,34,0])cylinder(d=1.5,h=18);
            translate([-23.8,29,0])cylinder(d=1.5,h=18);
        }

        hull(){
            translate([-20.65,-20.76,-5])cylinder(d=1.5,h=30);
            translate([20.65,-20.76,-5])cylinder(d=1.5,h=30);
            translate([17.9,24.5,-5])rotate([0,0,45])cube([4.95,4.95,30]);
            translate([-17.9,24.5,-5])rotate([0,0,45])cube([4.95,4.95,30]);
        }

        translate([0,26.5,-5])rotate([0,0,45])cube([4.95,4.95,30]);
        translate([0,30,0])cube([2.5,15,60],center=true);

        translate([-28,-11.5,10])rotate([0,15,0])cylinder(d=8,h=20,center=true);
        translate([28,-11.5,10])rotate([0,-15,0])cylinder(d=8,h=20,center=true);
        
        translate([0,-20.7,20])rotate([45,0,0])cube([20.65*2+1.5,5,5],center=true);
    }
}

module bolt_tighter(){
    translate([0,34,0])difference(){
        translate([-6.5,0,0])cube([13,11,18]);
        translate([0,0,0])cube([2.5,25,60], center=true);

        translate([0,12,19])rotate([45,0,0])cube([20,5,5], center=true);
        translate([0,12,-1])rotate([45,0,0])cube([20,5,5], center=true);
    
        translate([0,6,9])rotate([0,90,0])cylinder(d=4.5,h=20,center=true);
    }
}

module ductedfan(){
    color("DARKGRAY")difference(){
        union(){
                translate([-51/2,51/2+2,0]){
                translate([-1.5,0,0]){
                    difference(){
                        scale([1.06,1,1])cylinder(d=51,h=15);
                        translate([0,0,-1])cylinder(d=30,h=3);
                    }   
                }
                translate([5.5,-27.5,0])cube([20,27.5,15]);
            }
            
            hull(){
                translate([-47,7,0])cylinder(d=6,h=15);
                translate([-4,45,0])cylinder(d=6,h=15);
            }
        }

        translate([-47,7,-1])cylinder(d=4,h=20);
        translate([-4,45,-1])cylinder(d=4,h=20);
        
        translate([-20+(20-17.5)/2,-1,(15-12.5)/2])cube([17.5,10,12.5]);
    }   
    
}

module fanmountinghole(){
    
    
    translate([22+10,29-6,0]){
        difference(){
            hull(){
                cylinder(d=10, h=5);
                translate([-8,0,2.5])cube([1,12,5], center=true);
            }
            
            cylinder(d=3.5, h=15, center=true); // hole
        }
    }
}

module nozzle(){
    translate([11,-25-15,-24])rotate([-90,90,0]){
        cylinder(d1=2,d2=10,h=10);
        translate([-11,-16,10])cube([22,22,13]);
    }
}

module airduct_short_print(){
    rotate([0,20,-5])translate([37.5,-22,-12]){
        difference(){
            airduct_short(-20,0);
            airduct_short(-20,0.8);
            rotate([0,-20,0])translate([-13.5,-14-0.5,0])cube([7,2,20-1.6], center=true);
        }
    }
}
    
module airduct_short(r,w){
    hull(){
        translate([0,3,0])cube([17-w*2,2,22-w*2], center=true);
        translate([0,1,0])cube([15-w*2,2,20-w*2], center=true);
    }
    sgn=sign(r);
    step=4/abs(r);
    //echo (sign(r));
    
    hull()for(i=[0:1:abs(r)*2]){
        rotate([0,sgn*i*(i/abs(r)/4),0])translate([0,-i*step,0])cube([15-w*2,step+0.01,20-w*2], center=true);
    }
    rotate([0,-20,0])translate([0,-9,0])cube([15-w*2,2,20-w*2], center=true);
    
        hull()rotate([0,r,0]){
            translate([0,-8-2.5,0])cube([15-w*2,5-w*2,20-w*2], center=true);
            translate([-17,-14,0])cube([2-w*2,2,20-w*2], center=true);
            translate([-15,-12-w,0])cylinder(d=3,h=20-w*2,center=true);
        }
}

module airduct_long_print(){
    rotate([-88.72,3.3,20]){
        difference(){
            airduct_long(20,0);
            airduct_long(20,0.8);
            rotate([0,20,0])translate([45,-16,0])cube([8,4,18.4],center=true);
            
            //translate([-40,-30,0])cube([100,100,50]);
        }
        
    }
}

module airduct_long(r,w){
    translate([0,5,0])cube([17-w*2,2,22-w*2], center=true);
    hull(){
        translate([0,3,0])cube([17-w*2,2,22-w*2], center=true);
        translate([0,-1-w,0])rotate([90,0,0])cylinder(d=24-w*2.2,h=1+w, center=true);
    }

    difference(){
      hull(){
        translate([0,-7+w/2,0])rotate([90,0,0])cylinder(d=24-w*2,h=12-w*3, center=true);
        rotate([0,r,0]){
            //translate([40,-12+w/2,0])cube([2-w*2,4-w*3,20-w*2], center=true);
            translate([45,-16+w/2,0])difference(){
                cylinder(d=10-w*3,h=20-w*2,center=true);
                translate([0,-25.7+w*2,0])rotate([0,0,-3])cube([50,50,50], center=true);
            }
        }
      }
        rotate([0,r,0])translate([0,-18,0])rotate([0,0,-3.5])cube([100,10,100], center=true);
        
    }
}
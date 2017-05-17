$fn=50;
//translate([-100.25,-100,0])import("C:/Users/ppalonen/Downloads/MKMount_Strap.STL");

main_frame();
bolt_tighter();

translate([43,-20,0])rotate([0,-90,0])ductedfan();

translate([-45,-20,-40])rotate([0,90,0])ductedfan();

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
//fireti wallet clone

// id card size 85.60 × 53.98 mm
// bottle opener hole size 13.4x30
width = 53.98;
length = 85.60;
height = 3;
corner_radius = 2; //this shit doesn't scale

opener_width = 23;
opener_length = 23;

screw_size = 2;
screw_port_thickness = 2;
oring_thickness = 2;
dingus_width = screw_size+oring_thickness; //oring wraps around

$fn=20; //increase for final render

bevel_extrude(height=height,bevel_depth=height/3,$fn=16)

union()
{
    difference()
    {
        translate([corner_radius,corner_radius])
        {
            //wallet base
            hull()
            {
                //bottom left corner
                circle(r=corner_radius);
                
                //top left corner
                translate([0,length-corner_radius*2]) 
                    circle(r=corner_radius);
                
                //bottom right corner
                translate([width-corner_radius*2,0]) 
                    circle(r=corner_radius);
                
                //top right corner
                translate([width-corner_radius*2,length-corner_radius*2]) 
                    circle(r=corner_radius);  
            }
        }
        
        //bottle opener        
        translate([width-(opener_length-opener_width)-opener_width/2, length/2-opener_width/2])
        {
                hull()
                {
                    translate([0,opener_width/2])
                        circle(d=opener_width);
                 
                    translate([opener_width/2,0])
                        square([opener_length-(opener_width/2), opener_width]);
                }
        }
        
        //remove bottom sharp corner of opener
        translate([width-corner_radius, length/2-opener_width/2-corner_radius])
            square(2);

        //remove top sharp corner of opener
        translate([width-corner_radius, length/2+opener_width/2])
            square(2);
        
        //remove bottom left dingus hole
        translate([width/4,0])
        {
            union()
            {
                translate([0,dingus_width/2])
                    circle(d=dingus_width);
             
                translate([-dingus_width/2,0])
                    square([dingus_width,dingus_width/2]);
            }
        }
        
        //remove bottom right dingus hole
        translate([3*(width/4),0])
        {
                union()
                {
                    translate([0,dingus_width/2])
                        circle(d=dingus_width);
                 
                    translate([-dingus_width/2,0])
                        square([dingus_width,dingus_width/2]);
                }
                
            //remove sharp left corner
            translate([(-dingus_width/2)-corner_radius,0])
                square(2);
            
            //remove sharp right corner
            translate([dingus_width/2,0])
                square(2);
        }
        
        //remove top left dingus hole
        translate([width/4,length-dingus_width/2])
        {
            union()
            {
                translate([0,0])
                    circle(d=dingus_width);
             
                translate([-dingus_width/2,0])
                    square([dingus_width,dingus_width/2]);
            }
                
            //remove sharp left corner
            translate([(-dingus_width/2)-corner_radius,dingus_width/2-corner_radius])
                square(2);
            
            //remove sharp right corner
            translate([dingus_width/2,dingus_width/2-corner_radius])
                square(2);
        }
        //remove top right dingus hole
        translate([3*(width/4),length-dingus_width/2])
        {
            union()
            {
                translate([0,0])
                    circle(d=dingus_width);
             
                translate([-dingus_width/2,0])
                    square([dingus_width,dingus_width/2]);
            }
        //remove sharp left corner
        translate([(-dingus_width/2)-corner_radius,dingus_width/2-corner_radius])
            square(2);
        
        //remove sharp right corner
        translate([dingus_width/2,dingus_width/2-corner_radius])
            square(2);

        }

        }

        //add bottom rounded corner
        translate([width-corner_radius, length/2-opener_width/2-corner_radius])
            circle(r=corner_radius);
        
        //add top rounded corner
        translate([width-corner_radius, length/2+opener_width/2+corner_radius])
            circle(r=corner_radius);
        
        //rounded corners for bottom left dingus
        translate([(width/4)-(dingus_width/2)-corner_radius,corner_radius])
        {
            circle(r=corner_radius);
        }
        translate([(width/4)+(dingus_width/2)+corner_radius,corner_radius])
        {
            circle(r=corner_radius);
        }
        
        //rounded corners for bottom right dingus
        translate([3*(width/4)-(dingus_width/2)-corner_radius,corner_radius])
        {
            circle(r=corner_radius);
        }
        translate([3*(width/4)+(dingus_width/2)+corner_radius,corner_radius])
        {
            circle(r=corner_radius);
        }
        
        //rounded corners for top right dingus
        translate([3*(width/4),length-dingus_width/2])
        {
         //add rounded left corner
        translate([(-dingus_width/2)-corner_radius,dingus_width/2-corner_radius])
            circle(r=corner_radius);
        
        //add rounded right corner
        translate([dingus_width/2+corner_radius,dingus_width/2-corner_radius])
            circle(r=corner_radius);
        }
        
        //rounded corners for top left dingus
        translate([width/4,length-dingus_width/2])
        {
            //add rounded left corner
            translate([(-dingus_width/2)-corner_radius,dingus_width/2-corner_radius])
                circle(r=corner_radius);
            
            //add rounded right corner
            translate([dingus_width/2+corner_radius,dingus_width/2-corner_radius])
                circle(r=corner_radius);
        }
        

}

linear_extrude(height=height-1)
{
//add half height dingus to create pocket
    union()
    {
        translate([width/4,0])
        {
        translate([0,dingus_width/2])
            circle(d=dingus_width);
     
        translate([-dingus_width/2,0])
            square([dingus_width,dingus_width/2]);
        }
    }
    
}

linear_extrude(height=height/2)
        {
            translate([width/4,dingus_width])
            difference()
            {
                hull()
                {
                    circle(d=screw_size+screw_port_thickness);
                    
                    translate([-(screw_size+screw_port_thickness)/2,-(screw_size+screw_port_thickness)+.5])
                    square([screw_size+screw_port_thickness,screw_size+(screw_port_thickness)/2]);
                    
                }
                circle(d=screw_size);
            }
        }

//test objects -------------------------------------------

/*
//top left dingus hole
translate([65,0])
{
        union()
        {
            translate([0,0])
                circle(d=dingus_width);
         
            translate([-dingus_width/2,0])
                square([dingus_width,dingus_width/2]);
        }
}

//top right dingus hole
translate([80,0])
{
        union()
        {
            translate([0,0])
                circle(d=dingus_width);
         
            translate([-dingus_width/2,0])
                square([dingus_width,dingus_width/2]);
        }
}

//bottom right dingus hole
translate([80,10])
{
        union()
        {
            translate([0,dingus_width/2])
                circle(d=dingus_width);
         
            translate([-dingus_width/2,0])
                square([dingus_width,dingus_width/2]);
        }
}

//bottom left dingus hole
translate([65,10])
{
        union()
        {
            translate([0,dingus_width/2])
                circle(d=dingus_width);
         
            translate([-dingus_width/2,0])
                square([dingus_width,dingus_width/2]);
        }
}
*/
// Bevel Library----------------------  

module bevel_border(size=1)
{
	difference()
	{
		minkowski()
		{
			children();
			square(size,true);
		}
		children();
	}
}

module bevel_cutaway(bevel_depth=5)
{
	translate([0,0,-bevel_depth])
	minkowski()
	{
		linear_extrude(height=bevel_depth,convexity=5)
		bevel_border(1)
		children();
		cylinder(h=bevel_depth+1,r1=0,r2=bevel_depth*sqrt(2));
	}
}

module bevel_extrude(height=20,bevel_depth=1)
{
	difference()
	{
		linear_extrude(height=height,convexity=5)
		children();

		translate([0,0,height])
		bevel_cutaway(bevel_depth)
		children();
	}	
}
//fireti wallet clone

// id card size 85.60 × 53.98 mm
// bottle opener hole size 13.4x30

width = 53.98;
length = 85.60;
height = 2;
corner_radius = 2; //this shit doesn't scale

opener_width = 23;
opener_length = 23;

screw_size = 1.4;
screw_port_thickness = 1;
screw_spacing = 4.25;
oring_thickness = 2;
screw_pocket = screw_size+screw_port_thickness*2+oring_thickness*2;

$fn=100; //increase for final render

difference()
{
    bevel_extrude(height=height,bevel_depth=height/3,$fn=100)
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
            }

            //add bottom rounded corner
            translate([width-corner_radius, length/2-opener_width/2-corner_radius])
                circle(r=corner_radius);
            
            //add top rounded corner
            translate([width-corner_radius, length/2+opener_width/2+corner_radius])
                circle(r=corner_radius);
            
        }
          
        //bottom left oring pocket
        difference()
        {   
             union()
            {           
                translate([width/4,screw_spacing,height])
                {
                    cylinder(height,d=screw_pocket, center=true);
                    
                    translate([-(screw_pocket/2)+oring_thickness/2,-screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                    
                    translate([(screw_pocket/2)-oring_thickness/2,-screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                }
            }
            translate([width/4,screw_spacing/2,height])
                cube([screw_pocket-oring_thickness*2,screw_pocket/2-1,3],center=true);
        }
        
        //bottom right oring pocket
        difference()
        {   
             union()
            {           
                translate([(width/4)*3,screw_spacing,height])
                {
                    cylinder(height,d=screw_pocket, center=true);
                    
                    translate([-(screw_pocket/2)+oring_thickness/2,-screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                    
                    translate([(screw_pocket/2)-oring_thickness/2,-screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                }
            }
            translate([(width/4)*3,screw_spacing/2,height])
                cube([screw_pocket-oring_thickness*2,screw_pocket/2-1,3],center=true);
        }
       
        //top left oring pocket
       difference()
        {   
             union()
            {           
                translate([width/4,length-screw_spacing,height])
                {
                    cylinder(height,d=screw_pocket, center=true);
                    
                    translate([-(screw_pocket/2)+oring_thickness/2,screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                    
                    translate([(screw_pocket/2)-oring_thickness/2,screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                }
            }
            translate([width/4,length-screw_spacing/2,height])
                cube([screw_pocket-oring_thickness*2,screw_pocket/2-1,3],center=true);
        } 
        
       //top right oring pocket 
       difference()
        {   
             union()
            {           
                translate([(width/4)*3,length-screw_spacing,height])
                {
                    cylinder(height,d=screw_pocket, center=true);
                    
                    translate([-(screw_pocket/2)+oring_thickness/2,screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                    
                    translate([(screw_pocket/2)-oring_thickness/2,screw_spacing/2,0])
                        cube([oring_thickness,screw_spacing,height],center=true);
                }
            }
            translate([(width/4)*3,length-screw_spacing/2,height])
                cube([screw_pocket-oring_thickness*2,screw_pocket/2-1,3],center=true);
        } 

}

    //create bottom left oring channel w/ screw hole
    translate([width/4,screw_spacing,height/2])
    difference()
    {
        union()
        {
            cylinder(height,d=screw_size+screw_port_thickness*2, center=true);
            translate([-(screw_size+screw_port_thickness*2)/2,(-screw_spacing)+.5,0])
            cube([screw_size+screw_port_thickness*2,screw_spacing-.5,height/2]);
        }
        
        cylinder(height,d=screw_size);
    }
    
    //create bottom right oring channel w/ screw hole
    translate([(width/4)*3,screw_spacing,height/2])
    difference()
    {
        union()
        {
            cylinder(height,d=screw_size+screw_port_thickness*2, center=true);
            translate([-(screw_size+screw_port_thickness*2)/2,(-screw_spacing)+.5,0])
            cube([screw_size+screw_port_thickness*2,screw_spacing-.5,height/2]);
        }
        
        cylinder(height,d=screw_size);
    }
        
    //create top right oring channel w/ screw hole
    translate([(width/4)*3,length-screw_spacing,height/2])
    difference()
    {
        union()
        {
            cylinder(height,d=screw_size+screw_port_thickness*2, center=true);
            translate([-(screw_size+screw_port_thickness*2)/2,0,0])
            cube([screw_size+screw_port_thickness*2,screw_spacing-.5,height/2]);
        }
        
        cylinder(height,d=screw_size);
    }
    
    //create top right oring channel w/ screw hole
    translate([width/4,length-screw_spacing,height/2])
    difference()
    {
        union()
        {
            cylinder(height,d=screw_size+screw_port_thickness*2, center=true);
            translate([-(screw_size+screw_port_thickness*2)/2,0,0])
            cube([screw_size+screw_port_thickness*2,screw_spacing-.5,height/2]);
        }
        
        cylinder(height,d=screw_size);
    } 
    
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

data.raw["unit-spawner"]["spitter-spawner"].result_units = (function()
                     local res = {}

                       res[1] = {"small-biter", 		{{0.00, 0.3}, {0.05, 0.3}, {0.10, 0.0}}}        
					   
					   res[2] = {"small-spitter", 		{{0.05, 0.3}, {0.35, 0.3}, {0.45, 0.0}}}
                       res[3] = {"small-spitter-Mk2", 	{{0.15, 0.0}, {0.45, 0.3}, {0.55, 0.0}}}
					   res[4] = {"small-spitter-Mk3", 	{{0.25, 0.0}, {0.55, 0.3}, {0.65, 0.0}}}
					   
					   res[5] = {"medium-spitter", 	 	{{0.35, 0.0}, {0.65, 0.3}, {0.75, 0.0}}}
                       res[6] = {"medium-spitter-Mk2", 	{{0.45, 0.0}, {0.75, 0.3}, {0.85, 0.0}}}
					   res[7] = {"medium-spitter-Mk3", 	{{0.55, 0.0}, {0.85, 0.3}, {0.95, 0.0}}}
					   
					   res[8] = {"big-spitter",	 	 	{{0.65, 0.0}, {0.95, 0.3}, {1.00, 0.0}}}
                       res[9] = {"big-spitter-Mk2",	 	{{0.75, 0.0}, {1.00, 0.3}}}
					   res[10] = {"big-spitter-Mk3", 	{{0.85, 0.0}, {1.00, 0.3}}}
					   
					   res[11] = {"behemoth-spitter",  	{{0.95, 0.0}, {1.00, 0.3}}}					   			   
                    
                     return res
                   end)()
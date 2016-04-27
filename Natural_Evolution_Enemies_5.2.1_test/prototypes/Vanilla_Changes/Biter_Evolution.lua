data.raw["unit-spawner"]["biter-spawner"].result_units = (function()
                     local res = {}

                       res[1] = {"small-biter", 	{{0.00, 0.3}, {0.30, 0.3}, {0.40, 0.0}}}
                       res[2] = {"small-biter-Mk2", {{0.10, 0.0}, {0.40, 0.3}, {0.50, 0.0}}}
					   res[3] = {"small-biter-Mk3", {{0.20, 0.0}, {0.50, 0.3}, {0.60, 0.0}}}
					   
					   res[4] = {"medium-biter", 	 {{0.30, 0.0}, {0.60, 0.3}, {0.70, 0.0}}}
                       res[5] = {"medium-biter-Mk2", {{0.40, 0.0}, {0.70, 0.3}, {0.80, 0.0}}}
					   res[6] = {"medium-biter-Mk3", {{0.50, 0.0}, {0.80, 0.3}, {0.90, 0.0}}}
					   
					   res[7] = {"big-biter",	 	 {{0.60, 0.0}, {0.90, 0.3}, {1.00, 0.0}}}
                       res[8] = {"big-biter-Mk2",	 {{0.70, 0.0}, {1.00, 0.3}}}
					   res[9] = {"big-biter-Mk3", 	 {{0.80, 0.0}, {1.00, 0.3}}}
					   
					   res[10] = {"behemoth-biter",  {{0.90, 0.0}, {1.00, 0.3}}}					   			   
                    
                     return res
                   end)()
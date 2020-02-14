
# MAFF cells intersected 
MAFFs <- TFregulomeR::intersectPeakMatrix(peak_id_x = "MM1_HSA_K562_MAFF", motif_only_for_id_y = T,motif_only_for_id_x = T,
                                           peak_id_y = "MM1_HSA_HepG2_MAFF",motif_type = "TRANSFAC") #intersection of MAFF_k562 and  MAFF HepG2
                                           
TFregulomeR::exportMMPFM(fun_output = MAFFs, 
                          fun = "intersectPeakMatrix", 
                          save_motif_PFM = TRUE, 
                         save_betaScore_matrix = FALSE)                                           

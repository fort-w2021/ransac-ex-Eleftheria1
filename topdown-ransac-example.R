# immer set.seed() um Ergebnisse reproduzierbar zu machen...
set.seed(1874374111)
data_simple <- make_ransac_data(n_obs = 100, n_coef = 1, inlier_fraction = 0.7)

# univariate example:
ransac_simple <- ransaclm(y ~ . - inlier,
                                   data = data_simple, error_threshold = 2,
                                   inlier_threshold = 50, seed = 20171111
)
ransac_simple_parallel <- ransaclm_parallel(y ~ . - inlier,
                          data = data_simple, error_threshold = 2,
                          inlier_threshold = 50, seed = 20171111,
                          workers = 2
)
validate_ransac(ransac_simple)
validate_ransac(ransac_simple_parallel)


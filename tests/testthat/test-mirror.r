context("mirror functions")

test_that("mirror.matrix behaves", {
  boneMir.baseline=structure(c(125.178199789647,  124.929156625469,  127.939190221794,  120.844335707006,  128.580522595439,  117.387265718254,  131.559872059901,  112.851613970297,  123.505014987611,  126.78782832458,  47.1916278989272,  45.7391505463024,  42.4351808544346,  44.0312488330708,  52.2800138923838,  54.4515486448606,  49.944291820694,  53.3680972023179,  57.1598701009871,  61.7865702060215,  76.9623279190109,  80.2260472225798,  76.817533283308,  77.0929652922705,  27.7968408041985,  28.894126910985,  29.1837124177338,  31.3925210698209,  22.9847482078076,  48.411576872285), .Dim = c(10L, 
    3L))
  data(boneData)
  expect_equal(mirror(boneLM[,,1],icpiter=0), boneMir.baseline, tol=1e-6)
  
  skullMir.baseline=readRDS("testdata/skullMir.rds")
 
  expect_equal(mirror(skull_0144_ch_fe.mesh,icpiter=0),
               skullMir.baseline)
})

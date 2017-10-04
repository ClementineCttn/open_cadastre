library(jsonlite)
library(R.utils)
code = 75110

type = c("communes", "parcelles", "batiments")
l = c("black", "blue", NA)
f = c(NA, NA, "orange")
a = c(T, T, T)

for (code in 75101:75120){
for ( i in 1:3){
  file = paste0('cadastre-', code, '-', type[i], '.json.gz')
  url <- paste0('https://cadastre.data.gouv.fr/data/etalab-cadastre/2017-07-06/geojson/communes/', 
                as.numeric(substr(code, 1, 2)),'/', code, '/cadastre-', code, '-', type[i], '.json.gz')
  download.file(url,  file , method = "curl")
  gunzip(file)
  bat = readOGR(paste0('cadastre-', code, '-', type[i], '.json'))
  plot(bat, border = l[i], col = f[i], add = a[i])
}
}
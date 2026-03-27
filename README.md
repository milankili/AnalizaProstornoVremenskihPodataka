# Analiza prostorno-vremenskih podataka u R-u 🌍🕒

Dobrodošli u repozitorijum predmeta **Analiza prostorno-vremenskih podataka**. 
Ovaj materijal je namenjen za Master studije geoinformatike na Građevinskom fakultetu u Beogradu, 2026. godine. 
[https://milankili.github.io/AnalizaProstornoVremenskihPodataka/](https://milankili.github.io/AnalizaProstornoVremenskihPodataka/)

**Predavač:** Milan Kilibarda

Cilj ovog repozitorijuma je da objedini sve prezentacije i kodove koji se koriste tokom kursa, kako bi se olakšalo učenje, analiza, modelovanje i vizualizacija prostornih i prostorno-vremenskih podataka pomoću programskog jezika R. 

## 📚 Sadržaj prezentacija i predavanja

Kurs je podeljen u tematske celine koje postepeno uvode koncepte od osnova R-a do naprednih prostorno-vremenskih analiza primenom mašinskog učenja:

1. **Uvod u R**
   - Osnove programskog jezika R, sintaksa i RStudio okruženje.
   - Tipovi i strukture podataka, funkcije i uvoz/izvoz podataka.

2. **Uvod u Tidyverse**
   - Kolekcija R paketa (`ggplot2`, `dplyr`, `tidyr`, `readr`...) za manipulaciju i vizualizaciju podataka.
   - Pisanje "urednog" (tidy) koda i osnove eksploratorne analize podataka.

3. **Tipovi prostornih podataka u R-u**
   - Klasifikacija prostornih podataka: Površinski (vektorski i rasterski), geostatistički, point pattern (tačkasti obrasci) i podaci o kretanju (mobility data).
   - Izvori prostornih podataka (daljinska detekcija, senzori, društvene mreže).

4. **Vektorski podaci: R paket `sf`**
   - Uvod u rad sa *Simple Features* podacima u R-u.
   - Geometrijske operacije (preseci, bufer zone, centroidi) i direktna manipulacija integrisana sa Tidyverse.

5. **Rasterski podaci: `terra` paket u R-u**
   - Rad sa rasterskim modelima (digitalni model terena, klimatski podaci, satelitski snimci).
   - Struktura `SpatRaster` klase i operacije: lokalne (npr. računanje NDVI indeksa), globalne, fokalne i zonalne.

6. **Vremenske serije u R-u**
   - Upravljanje vremenskim podacima (`Date`, `POSIXct`, paket `lubridate`) i manipulacija klasama vremenskih serija (`ts`, `xts`).
   - Pretraga satelitskih snimaka pomoću STAC kataloga (paket `rstac`) i rad sa prostorno vremenskim kockama pomoću `gdalcubes`.

7. **Prostorno-vremenski podaci: R paket `stars`**
   - Rad sa *spacetime data cubes* (prostorno-vremenskim kockama) sa više dimenzija (npr. x, y, time, band).
   - Učitavanje NetCDF i HDF formata, optimizacija memorije putem `stars_proxy` objekata i rad sa cloud podacima (Zarr format, COG).

8. **Metode prostorne i prostorno-vremenske interpolacije**
   - Metode interpolacije bez i sa prediktorima.
   - Napredne metode mašinskog učenja: Random Forest Spatial Interpolation (RFSI) i prostorno-vremenski kriging.

9. **Prostorno-vremenski podaci: R paket `sits`**
   - Analiza vremenskih serija satelitskih snimaka (Satellite Image Time Series).
   - Kompletan "pipeline": kreiranje data kocke -> uzorkovanje (`samples`) -> treniranje modela mašinskog učenja -> klasifikacija (`classify`) -> izrada tematske karte post-procesiranjem.

## 🛠️ Glavni R paketi korišćeni u kursu

Za uspešno praćenje vežbi, potrebno je da imate instalirane sledeće pakete:
- **Osnovni set:** `tidyverse` (posebno `dplyr`, `ggplot2`, `lubridate`).
- **Vektorski i rasterski GIS podaci:** `sf`, `terra`.
- **Prostorno-vremenske kocke:** `stars`, `gdalcubes`, `sftime`.
- **Satelitski podaci u oblaku i STAC:** `rstac`, `sits`.
- **Geostatistika i interpolacija:** `gstat`, `spacetime`, `xts`.

## 📖 Preporučena literatura

Materijali i analize pokrivene na ovim predavanjima u velikoj meri se oslanjaju na sledeću literaturu:

* **Pebesma, E., & Bivand, R. (2023).** *Spatial Data Science: With Applications in R*. Chapman and Hall/CRC. 
  * Dostupno na: [https://r-spatial.org/book/](https://r-spatial.org/book/)
* **Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023).** *R for Data Science* (2nd ed.). O'Reilly Media. 
  * Dostupno na: [https://r4ds.hadley.nz/](https://r4ds.hadley.nz/)
* **Moraga, P. (2023).** *Spatial Statistics for Data Science: Theory and Practice with R*. Chapman and Hall/CRC. 
  * Dostupno na: [https://www.paulamoraga.com/book-spatial/](https://www.paulamoraga.com/book-spatial/)
* **Camara, G., Simoes, R., Souza, F., Carlos, F., Andrade, P., Ferreira, K., Brito, P., Assunção, A., & Pelletier, C. (2024).** *Satellite Image Time Series Analysis on Earth Observation Data Cubes*. 
  * Dostupno na: [https://e-sensing.github.io/sitsbook/](https://e-sensing.github.io/sitsbook/)
* **Sekulić, A., Kilibarda, M., Heuvelink, G. B., Nikolić, M., & Bajat, B. (2020).** *Random Forest Spatial Interpolation*. Remote Sensing, 12(10), 1687. 
  * Dostupno na: [https://www.mdpi.com/2072-4292/12/10/1687](https://www.mdpi.com/2072-4292/12/10/1687)
* **Kilibarda, M.** *Matematička kartografija*. 
  * Dostupno na: [https://osgl.grf.bg.ac.rs/books/mk/](https://osgl.grf.bg.ac.rs/books/mk/)
```
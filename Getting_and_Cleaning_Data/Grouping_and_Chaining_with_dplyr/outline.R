
### group_by()
by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                     count = n(),
                     unique = n_distinct(ip_id),
                     countries = n_distinct(country),
                     avg_bytes = mean(size))

top_counts <- filter(pack_sum, count > 750)
arrange(top_counts, desc(count))
head(arrange(pack_sum, desc(count)), 20)

top_unique <- filter(downloads, unique > 500)
arrange(top_unique, desc(unique))
head(arrange(top_unique, desc(unique)), 20)

cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes) # reward packages for being small

filter(downloads, package == "swirl")

###

countries <- group_by(cran, country)
setup <- summarize(countries,
                   count = n(),
                   dist_packages = n_distinct(package),
                   prop_linux = mean(r_os == "linux-gnu", na.rm = TRUE),
                   prop64 = mean(r_arch == "x86_64", na.rm = TRUE))
setup_ss <- filter(setup, count > 1000)
arrange(setup_ss, desc(count))
arrange(setup_ss, desc(dist_packages))
arrange(setup_ss, desc(prop_linux))

# Give attribution here - SO thread
most_common <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

setup <- summarize(countries,
                   count = n(),
                   dist_packages = n_distinct(package),
                   mc_os = most_common(r_os),
                   mc_process = most_common(r_arch),
                   mc_r_version = most_common(r_version))
arrange(setup, mc_r_version)

### Chaining
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  arrange(desc(size_mb))

cran %>%
  select(r_os, r_version, package, version) %>%
  filter(package == "swirl") %>%
  group_by(version) %>%
  summarize(count = n(),
            num_os = n_distinct(r_os),
            num_r_vers = n_distinct(r_version),
            num_old_r = sum(r_version <= "3.1.1", na.rm=TRUE))




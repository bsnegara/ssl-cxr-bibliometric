# Kleinberg (2003) two-state burst detection for batched (yearly) counts.
# r: documents containing the term per year; d: total documents per year.
kleinberg_burst <- function(r, d, s = 2, gamma = 1) {
  n <- length(r); p0 <- sum(r) / sum(d)
  p1 <- min(s * p0, 0.9999); tau <- gamma * log(n)
  c0 <- -dbinom(r, d, p0, log = TRUE)
  c1 <- -dbinom(r, d, p1, log = TRUE)
  C <- matrix(Inf, 2, n); B <- matrix(1L, 2, n)
  C[, 1] <- c(c0[1], tau + c1[1])
  for (t in 2:n) {
    a <- C[1, t - 1]; b <- C[2, t - 1]
    C[1, t] <- min(a, b) + c0[t];       B[1, t] <- if (a <= b) 1L else 2L
    C[2, t] <- min(a + tau, b) + c1[t]; B[2, t] <- if (a + tau < b) 1L else 2L
  }
  st <- integer(n); st[n] <- which.min(C[, n])
  for (t in n:2) st[t - 1] <- B[st[t], t]
  list(burst = st == 2, strength = sum((c0 - c1)[st == 2]))
}

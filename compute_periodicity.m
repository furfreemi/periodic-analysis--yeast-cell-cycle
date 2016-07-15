function plevel = compute_periodicity(a, b, c, d, e, f, g, h, i, j)
data_col = [a b c d e f g h i j]';
[mag, x] = periodogram(data_col);
plevel = max(mag);

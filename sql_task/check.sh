if cmp --silent -- goal_utf8.csv result/result.csv; then
  echo "Files contents are identical"
else
  echo "Files are differt"
fi
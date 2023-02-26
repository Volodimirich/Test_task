if cmp --silent -- goal/goal_utf8.csv result/result.csv; then
  echo "Files contents are identical"
else
  echo "Files are different"
fi
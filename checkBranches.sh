repositories=(
  connected-commons
  bash
  connected-consumer-app
)

for repo in "${repositories[@]}"
do
  if [ ! -d "$repo" ]; then
    echo -e "\033[31m\033[4m$repo\033[24m is missing\033[0m"
  fi
done

if [[ "$1" == "" ]] || [[ "$2" == "" ]];then
  return
fi

mode="$1"

if [[ ! -f "$2" ]]; then
  return
fi

# freeze_apps=""
source $2

for app in $freeze_apps; do
  if [[ "$app" == "com.android.vending" ]]; then
    pm disable com.google.android.gsf 2> /dev/null
    pm disable com.google.android.gsf.login 2> /dev/null
    pm disable com.google.android.gms 2> /dev/null
    pm disable com.android.vending 2> /dev/null
    pm disable com.google.android.play.games 2> /dev/null
    pm disable com.google.android.syncadapters.contacts 2> /dev/null
  elif [[ "$mode" == "suspend" ]]; then
    pm suspend ${app} 2> /dev/null
    am force-stop ${app} 2> /dev/null
    am kill current ${app} 2> /dev/null
  else
    pm disable ${app} 2> /dev/null
  fi
done

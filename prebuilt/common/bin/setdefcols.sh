#!/system/bin/sh

NCWD=`pwd`
#cmparts settings
if [ -d /data/data/com.cyanogenmod.cmparts/shared_prefs ]; then
  cd /data/data/com.cyanogenmod.cmparts/shared_prefs
else
  mkdir -p /data/data/com.cyanogenmod.cmparts/shared_prefs
  cd /data/data/com.cyanogenmod.cmparts/shared_prefs
fi
if [ -f com.cyanogenmod.cmparts_preferences.xml ]; then
  cat com.cyanogenmod.cmparts_preferences.xml | grep -v "</map>" > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
else
  echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" > com.cyanogenmod.cmparts_preferences.xml
  echo "<map>" >> com.cyanogenmod.cmparts_preferences.xml
fi
#show battery icon
cat com.cyanogenmod.cmparts_preferences.xml | grep -v pref_battery_percentage > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<boolean name=\"pref_battery_percentage\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"battery_percentage_status_icon\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('battery_percentage_status_icon','1');"
#battery percentage text color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"battery_status_color_title\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('battery_status_color_title','1');"
#show clock on status bar
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_status_clock > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<boolean name=\"show_status_clock\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_status_clock\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_status_clock','1');"
#show clock am/pm
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_clock_am_pm > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<boolean name=\"show_clock_am_pm\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_clock_period\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_clock_period','1');"
#clock text color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"clock_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('clock_color','-1');"
#show dbm
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_status_dbm > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<boolean name=\"show_status_dbm\" value=\"false\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_status_dbm\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_status_dbm','0');"
#dbm text color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"dbm_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('dbm_color','-1');"
#date text color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"date_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('date_color','-1');"
#spn label color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"spn_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('spn_label_color','-1');"
#show spn on statusbar
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_spn_sb > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<string name=\"show_spn_sb\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_spn_sb\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_spn_sb','1');"
#show spn on lockscreen
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_spn_ls > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<string name=\"show_spn_ls\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_spn_ls\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_spn_ls','1');"
#plmn label color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"plmn_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('plmn_label_color','-1');"
#show plmn on statusbar
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_plmn_sb > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<string name=\"show_plmn_sb\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_plmn_sb\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_plmn_sb','1');"
#show plmn on lockscreen
cat com.cyanogenmod.cmparts_preferences.xml | grep -v show_plmn_ls > com.cyanogenmod.cmparts_preferences.xml.new && rm com.cyanogenmod.cmparts_preferences.xml && mv com.cyanogenmod.cmparts_preferences.xml.new com.cyanogenmod.cmparts_preferences.xml
echo "<string name=\"show_plmn_ls\" value=\"true\" />" >> com.cyanogenmod.cmparts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_plmn_ls\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_plmn_ls','1');"
#new notifications ticker color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"new_notifications_ticker_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('new_notifications_ticker_color','-1');"
#notifications count color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_count_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_count_color','-1');"
#no notifications color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"no_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('no_notifications_color','-1');"
#clear button label color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"clear_button_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('clear_button_label_color','-1');"
#ongoing notifications color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"ongoing_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('ongoing_notifications_color','-1');"
#latest notifications color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"latest_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('latest_notifications_color','-1');"
#notifications title color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_title_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_title_color','-1');"
#notifications text color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_text_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_text_color','-1');"
#notifications time color
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_time_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_time_color','-1');"
echo "</map>" >> com.cyanogenmod.cmparts_preferences.xml

#adw launcher background push colors
if [ -d /data/data/com.android.launcher/shared_prefs ]; then
  cd /data/data/com.android.launcher/shared_prefs
else
  mkdir -p /data/data/com.android.launcher/shared_prefs
  cd /data/data/com.android.launcher/shared_prefs
fi
if [ -f launcher.preferences.almostnexus.xml ]; then
  cat launcher.preferences.almostnexus.xml | grep -v highlights_color > launcher.preferences.almostnexus.xml.new && rm launcher.preferences.almostnexus.xml && mv launcher.preferences.almostnexus.xml.new launcher.preferences.almostnexus.xml
  cat launcher.preferences.almostnexus.xml | grep -v highlights_color_focus > launcher.preferences.almostnexus.xml.new && rm launcher.preferences.almostnexus.xml && mv launcher.preferences.almostnexus.xml.new launcher.preferences.almostnexus.xml
  cat launcher.preferences.almostnexus.xml | grep -v "</map>" > launcher.preferences.almostnexus.xml.new && rm launcher.preferences.almostnexus.xml && mv launcher.preferences.almostnexus.xml.new launcher.preferences.almostnexus.xml
else
  echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" > launcher.preferences.almostnexus.xml
  echo "<map>" >> launcher.preferences.almostnexus.xml
fi
echo "<int name=\"highlights_color\" value=\"-7560499\" />" >> launcher.preferences.almostnexus.xml
echo "<int name=\"highlights_color_focus\" value=\"-7560499\" />" >> launcher.preferences.almostnexus.xml
echo "</map>" >> launcher.preferences.almostnexus.xml
cd $NCWD

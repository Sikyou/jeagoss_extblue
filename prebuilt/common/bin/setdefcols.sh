#!/system/bin/sh

NCWD=`pwd`
cd /data/data/com.android.spare_parts/shared_prefs
cat com.android.spare_parts_preferences.xml | grep -v "</map>" > com.android.spare_parts_preferences.xml.new && rm com.android.spare_parts_preferences.xml && mv com.android.spare_parts_preferences.xml.new com.android.spare_parts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"clock_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_status_clock\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('clock_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_status_clock','1');"
cat com.android.spare_parts_preferences.xml | grep -v show_status_clock > com.android.spare_parts_preferences.xml.new && rm com.android.spare_parts_preferences.xml && mv com.android.spare_parts_preferences.xml.new com.android.spare_parts_preferences.xml
echo "<boolean name=\"show_status_clock\">true</string>" >> com.android.spare_parts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"date_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('date_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"spn_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_spn_sb\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('spn_label_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_spn_sb','1');"
cat com.android.spare_parts_preferences.xml | grep -v show_spn_sb > com.android.spare_parts_preferences.xml.new && rm com.android.spare_parts_preferences.xml && mv com.android.spare_parts_preferences.xml.new com.android.spare_parts_preferences.xml
echo "<string name=\"show_spn_sb\" value=\"true\" />" >> com.android.spare_parts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"plmn_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"show_plmn_sb\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('plmn_label_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('show_plmn_sb','1');"
cat com.android.spare_parts_preferences.xml | grep -v show_plmn_sb > com.android.spare_parts_preferences.xml.new && rm com.android.spare_parts_preferences.xml && mv com.android.spare_parts_preferences.xml.new com.android.spare_parts_preferences.xml
echo "<string name=\"show_plmn_sb\" value=\"true\" />" >> com.android.spare_parts_preferences.xml
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"new_notifications_ticker_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('new_notifications_ticker_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"no_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('no_notifications_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"clear_button_label_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('clear_button_label_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"ongoing_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('ongoing_notifications_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"latest_notifications_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('latest_notifications_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_title_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_title_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_text_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_text_color','-1');"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "DELETE FROM \"system\" WHERE \"name\" = \"notifications_time_color\";"
/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "INSERT INTO \"system\" (\"name\", \"value\") VALUES('notifications_time_color','-1');"
echo "</map>" >> com.android.spare_parts_preferences.xml

if [ -d /data/data/com.android.launcher/shared_prefs ]; then
  cd /data/data/com.android.launcher/shared_prefs
else
  mkdir -p /data/data/com.android.launcher/shared_prefs
  cd /data/data/com.android.launcher/shared_prefs
fi
if [ -f launcher.preferences.almostnexus.xml ]; then
  cat launcher.preferences.almostnexus.xml | grep -v highlights_color > launcher.preferences.almostnexus.xml.new && rm launcher.preferences.almostnexus.xml && mv launcher.preferences.almostnexus.xml.new launcher.preferences.almostnexus.xml
  cat launcher.preferences.almostnexus.xml | grep -v "</map>" > launcher.preferences.almostnexus.xml.new && rm launcher.preferences.almostnexus.xml && mv launcher.preferences.almostnexus.xml.new launcher.preferences.almostnexus.xml
else
  echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" > launcher.preferences.almostnexus.xml
  echo "<map>" >> launcher.preferences.almostnexus.xml
fi
echo "<int name=\"highlights_color\" value=\"-7560499\" />" >> launcher.preferences.almostnexus.xml
echo "<int name=\"highlights_color_focus\" value=\"-7560499\" />" >> launcher.preferences.almostnexus.xml
echo "</map>" >> launcher.preferences.almostnexus.xml
cd $NCWD

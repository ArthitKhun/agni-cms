

=====ขั้นตอนการติดตั้ง=====

1. ปรับ chmod 777 (write permission) ให้กับ folder เหล่านี้...
application/cache (ทุกไฟล์ในนี้)
application/log (ทุกไฟล์ในนี้)
public/upload/ (ทุกไฟล์ และ โฟลเดอร์ในนี้)
public/themes
modules

2. นำเข้า "agni.sql" ไปในฐานข้อมูล mysql

3. ตั้งค่าฐานข้อมูลในไฟล์
application/config/database.php

4. ปรับแต่งค่าบางอย่างเกี่ยวกับ hash text, cookie prefix, cookie domain, และอื่นๆใน
application/config/config.php

5. เปลี่ยนการตั้งค่า mod rewrite
เปิดไฟล์ .htaccess
เปลี่ยนค่า RewriteBase เป็นตำแหน่งที่ติดตั้งเว็บ เช่น. /
บันทึกและปิด.


=====ทดสอบ=====

เปิด URL ไปยังตำแหน่งที่ติดตั้ง
เช่น. http://localhost

บันทึกเข้าด้วย username และ password เหล่านี้
username: admin
password: pass

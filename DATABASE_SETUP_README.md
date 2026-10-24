# Sun Son Solar — Database-connected CodeIgniter project

## XAMPP setup
1. Extract this folder into `C:\xampp\htdocs\`.
2. Start **Apache** and **MySQL** in XAMPP.
3. Open `http://localhost/phpmyadmin`.
4. Import `database/sun_son_solar.sql` (this dump creates the `sun_son_solar` database, tables, auto-increment IDs, foreign keys, and starter services).
5. Select the `sun_son_solar` database in phpMyAdmin, open **Import**, and import `database/001_add_platform_features.sql` only if you need the extra platform tables. Back up any existing database before importing a full dump.
6. Check `application/config/database.php`. Defaults are `localhost`, username `root`, blank password, database `sun_son_solar`. If your MySQL credentials differ, update these settings.
7. Open the project URL in your browser. Depending on your Apache rewrite setup, use `http://localhost/bodong-group-db-connected/` or `http://localhost/bodong-group-db-connected/index.php`.

## Confirm that form entries are saved
- Submit a quote request from the website, then open phpMyAdmin → `sun_son_solar` → `quote_requests`.
- Create a customer account, then check `users`.
- Create an appointment, then check `appointments` (and `notifications` where the app creates notifications).
- Admin-managed products, payments/receipts, support tickets, and reports are stored in their matching database tables when the corresponding forms/actions are submitted.

Refresh the table's **Browse** tab after submitting a form. The browser UI showing data does not by itself mean it was saved; rows must appear in the matching MySQL table.

## Important
- Data is saved only when the related form submits successfully to a PHP/CodeIgniter controller that performs an INSERT/UPDATE. Text entered into a frontend-only field or a form that only uses JavaScript/localStorage will not automatically appear in MySQL.
- This package configures the app to use the `sun_son_solar` database and includes the SQL setup files. It does not configure external email/SMS/payment providers.

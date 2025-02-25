# TUI20250225
# 構想
希望可以用TUI來完成填寫日記
並限制只有輸入系統登入密碼能順利填寫

# 步驟
## 架構
1. 問候使用者
2. 輸入密碼
3. 選擇心情
4. 選擇日期
5. 填寫日記
6. 儲存到 mood.txt
7. 顯示結束問候
8. 顯示 mood.txt 內容
9. 清理暫存檔案

## 創建執行檔內容
```
vim tui_workshop.sh
```
## 轉其性質為可執行狀態
```
chmod +x tui_workshop.sh
```
![image](https://github.com/user-attachments/assets/36e56ab6-0b65-4172-a965-5e04e12ba658)

## 執行
```
./tui_workshop.sh
```
## 截圖
### 問候語
![image](https://github.com/user-attachments/assets/011ea26a-569c-4bfc-b07c-670fe8238031)

### 輸入密碼
![image](https://github.com/user-attachments/assets/34846609-96ac-4049-a8e8-69d2afafc03d)

### 如果密碼錯誤
![image](https://github.com/user-attachments/assets/d82be118-1373-4d4c-bc46-707617e02b76)

### 選擇心情
![image](https://github.com/user-attachments/assets/7532fd3b-5d28-413d-8633-0667111c4d0a)

### 選擇日期
![image](https://github.com/user-attachments/assets/18e23ec1-fafb-4399-811f-f21206838672)

### 輸入隨筆日記
![image](https://github.com/user-attachments/assets/5c6ff5a5-b03b-418a-87ba-381fd253e719)

### 結尾問候
![image](https://github.com/user-attachments/assets/994d4d47-1801-43f7-baa1-2bdb8dcd3c4c)

### 秀出剛才填寫的內容
![image](https://github.com/user-attachments/assets/17683239-eb24-482a-aeb9-659a7b16e479)

### 他會存在mood.txt
![image](https://github.com/user-attachments/assets/742221bc-8b72-4b62-aefb-df9f913f4418)

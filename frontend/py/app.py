from admin import Admin

class WebPandaiApp:
    def __init__(self):
        self.admin = Admin()

    def register(self):
        print("\n=== Register ===")
        username = input("Masukkan username: ")
        email = input("Masukkan email: ")
        password = input("Masukkan password: ")
        self.admin.register_user(username, email, password)

    def login(self):
        print("\n=== Login ===")
        email = input("Masukkan email: ")
        password = input("Masukkan password: ")

        user = self.admin.authenticate_user(email, password)
        if user:
            if user.role == "admin":
                print("Berhasil login sebagai Admin. Anda akan diarahkan ke dashboard admin.")
            else:
                print("Selamat datang di Web Pandai!")
        else:
            print("Email atau password salah!")

    def run(self):
        while True:
            print("\n=== Menu ===")
            print("1. Register")
            print("2. Login")
            print("3. Keluar")
            choice = input("Pilih menu (1/2/3): ")
            if choice == '1':
                self.register()
            elif choice == '2':
                self.login()
            elif choice == '3':
                print("Keluar dari program. Sampai jumpa!")
    

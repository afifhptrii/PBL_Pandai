from user import User

class Admin:
    def __init__(self):
        self.users = []
        self.initialize_admins()

    def initialize_admins(self):
        """Tambahkan admin default ke dalam sistem"""
        admins = [
            User("Abdil", "abdil@gmail.com", "admin123", "admin"),
            User("Bhanu", "bhanu@gmail.com", "admin123", "admin"),
            User("Afifah", "afifah@gmail.com", "admin123", "admin")
        ]
        self.users.extend(admins)

    def register_user(self, username, email, password):
        if not email.endswith("@gmail.com"):
            print("Registrasi gagal! Email harus menggunakan '@gmail.com'.")
            return False

        if any(user.email == email for user in self.users):
            print("Email sudah terdaftar! Gunakan email lain.")
            return False

        self.users.append(User(username, email, password, "client"))
        print("Terima kasih sudah daftar akun di Web Pandai!")
        return True

    def authenticate_user(self, email, password):
        for user in self.users:
            if user.email == email and user.check_password(password):
                return user
        return None

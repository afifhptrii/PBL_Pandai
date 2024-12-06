from werkzeug.security import generate_password_hash, check_password_hash

class User:
    def __init__(self, username, email, password, role):
        self.username = username
        self.email = email
        self.password = generate_password_hash(password)
        self.role = role

    def check_password(self, password):
        return check_password_hash(self.password, password)

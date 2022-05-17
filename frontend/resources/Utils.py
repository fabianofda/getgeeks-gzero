from faker import Faker
fake = Faker()

def screenshot_name():
    return fake.sha1()
    
from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

def factory_user(target):
    data = {
        'fake': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'wrong_email': {
            'name': 'Pedro',
            'lastname': 'De Lara',
            'email': 'pedro_ll#mmsn.com',
            'password': 'pwd123'
        },
        'login': {
            'name': 'Fabiano',
            'lastname': 'Andrade',
            'email': 'fabiano@gmail.com',
            'password': 'pwd123'
        },
        'be_geek': {
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Manutenção geral de informatica, pc, note, impressoras, internet e rede, formatação de SO, remoção de virus em geral.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'attempt_be_geek': {
            'name': 'Peter',
            'lastname': 'Jordam',
            'email': 'peter.jordam@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '21999999999',
                'desc': 'Manutenção geral de informatica, pc, note, impressoras, internet e rede, formatação de SO, remoção de virus em geral.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'searcher': {
            'name': 'Johnny',
            'lastname': 'Lawrence',
            'email': 'johnny@cobrakay.com',
            'password': 'pwd123'
        },
        'search_alien': {
            'name': 'Dok',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999999991',
                'desc': 'Manutenção geral de impressoras, a fita matricial 3d jato de tinta',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_common': {
            'name': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999999992',
                'desc': 'Manutenção geral de informatica, pc, note, impressoras, internet e rede, formatação de SO, remoção de virus em geral.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '120'
            }
        }

    }
    return  data[target]

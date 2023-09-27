class MinList:
    def __init__(self):
        self.items = []
        self.size = 0
    
    def append(self, item):
        """
        >>> m = MinList()
        >>> m.append(4)
        >>> m.append(2)
        >>> m.size
        2
        """
        self.items.append(item)
        self.size += 1

    def pop(self):
        """
        >>> m = MinList()
        >>> m.append(4)
        >>> m.append(1)
        >>> m.append(5)
        >>> m.pop()
        1
        >>> m.size
        2
        """
        self.size -= 1
        return self.items.pop(min(self.items))
        
class Email:
    def __init__(self, msg, sender_name, recipient_name):
        self.msg = msg
        self.sender_name = sender_name
        self.recipient_name = recipient_name

class Server:
    def __init__(self):
        self.clients = {}
    
    def send(self, email):
        client = self.clients[email.recipient_name]
        client.receive(email)     

    def register_client(self, client, client_name):
        self.clients[client_name] = client

class Client:
    def __init__(self, server, name):
        self.name = name
        self.inbox = []
        self.server = server
        self.server.register_client(self, self.name)

    def compose(self, msg, recipient_name):
        email = Email(msg, self, recipient_name)
        self.server.send(email)
    
    def receive(self, email):
        self.inbox.append(email)

class Pet():
    def __init__(self, name, owner):
        self.is_alive = True # It's alive!!!
        self.name = name
        self.owner = owner

    def eat(self, thing):
        print(self.name + " ate a " + str(thing) + "!")

    def talk(self):
        print(self.name)

class Dog(Pet):
    def talk(self):
        print(self.name + 'says woof!')

class Cat(Pet):
    def __init__(self, name, owner, live=9):
        super().__init__(name, owner)
        self.lives = live

    def talk(self):
        print(self.name + ' says meow!')

    def lose_life(self):
        if self.live:
            self.live -= 1
            if not self.live:
                self.is_alive = False
        else:
            print('The cat has no more lives to lose.')

class NoisyCat(Cat):

    def __init__(self, name, owner, lives):
        Cat.__init__(self, name, owner, lives)
        
    def talk(self):
        """
        >>> NoisyCat('Magic', 'James').talk()
        Magic says meow!
        Magic says meow!
        """
        print('{0} says meow!\n{1} says meow!'.format(self.name, self.name))

    def __repr__(self):
        """
        >>> muffin = NoisyCat('Muffin', 'Catherine')
        >>> repr(muffin)
        "NoisyCat('Muffin', 'Catherine')"
        >>> muffin
        NoisyCat('Muffin', 'Catherine')
        """
        return "NoisyCat({0}, {1})".format(repr(self.name), repr(self.owner))
        
    
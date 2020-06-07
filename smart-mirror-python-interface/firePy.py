from firebase import firebase  

config = {
  "apiKey": "AIzaSyA6AKPzK0IpKEVkuZ4YEXRIQjl8pk4-wDs",
   " authDomain": "smartm-1b385.firebaseapp.com",
   " databaseURL": "https://smartm-1b385.firebaseio.com",
    "projectId": "smartm-1b385",
    "storageBucket": "smartm-1b385.appspot.com",
    "messagingSenderId": "1001108536175",
   " appId": "1:1001108536175:web:668a10d925cab3c774469a",
    "measurementId": "G-7KXFTZCQ6L"
}
 
firebase = firebase.FirebaseApplication('https://smartm-1b385.firebaseio.com/', None)  
result = firebase.get('/User/', '')  
result2=firebase.get('/User/User1/News/NewsOn', '') 
print(result)  
print(result2)  

 

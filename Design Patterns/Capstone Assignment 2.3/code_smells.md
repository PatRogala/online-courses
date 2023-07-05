# Code Smells

## 1. Duplicate code

### ContactList.java
### loadContacts() method
### ItemList.java
### loadItems() method

```java
// ItemList.java
public void loadItems(Context context) {

    try {
        FileInputStream fis = context.openFileInput(FILENAME);
        InputStreamReader isr = new InputStreamReader(fis);
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<Item>>() {
        }.getType();
        items = gson.fromJson(isr, listType); // temporary
        fis.close();
    } catch (FileNotFoundException e) {
        items = new ArrayList<Item>();
    } catch (IOException e) {
        items = new ArrayList<Item>();
    }
    notifyObservers();
}

// ContactList.java
public void loadContacts(Context context) {

    try {
        FileInputStream fis = context.openFileInput(FILENAME);
        InputStreamReader isr = new InputStreamReader(fis);
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<Contact>>() {}.getType();
        contacts = gson.fromJson(isr, listType); // temporary
        fis.close();
    } catch (FileNotFoundException e) {
        contacts = new ArrayList<Contact>();
    } catch (IOException e) {
        contacts = new ArrayList<Contact>();
    }
    notifyObservers();
}
```

### Explanation
The loadContacts() and loadItems() methods are almost identical. The only difference is the type of object that is being loaded. The code should be refactored to remove the duplicate code.

### Solution
Create a new method that takes in a Type object as a parameter. The loadContacts() and loadItems() methods should be refactored to call the loadObjects() method.

<hr>

## 2. Excessive usage of comments

### EditContactActivity.java
### saveContact() method

```java
// Check that username is unique AND username is changed (Note: if username was not changed
// then this should be fine, because it was already unique.)
if (!contact_list_controller.isUsernameAvailable(username_str) &&
        !(contact.getUsername().equals(username_str))){
    username.setError("Username already taken!");
    return;
}

// Reuse the contact id
String id_str = contact_controller.getId();
Contact updated_contact = new Contact(username_str, email_str, id_str);

// Edit Contact: replace contact with updated contact
boolean success = contact_list_controller.editContact(contact, updated_contact, context);
if (!success) {
    return;
}

// End EditContactActivity
finish();
```

### Explanation
In the saveContact() method, there are several comments that are not necessary. The comments are explaining what the code is doing, which is redundant. The code is already self-explanatory, and the comments are not adding any additional information. The comments should be removed.

### Solution
Remove the comments.
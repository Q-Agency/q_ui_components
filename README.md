Package with custom buttons and text fields

## Features

With this package you can create:

- a button with icon, text, leading icon and text, leading icon and text and trailing icon.
- a email text field with built in validator, and a password field with a built in validation
- a custom text field

## Getting started

To start using this package just add this code snippet to your dependecyes in your pubspe.yaml file

```dart
q_ui_components:
    git:
      url: https://github.com/Q-Agency/q_ui_components
      ref: master
```

## Usage

These are just some of the ways you can instantiate and customize these widgets:

--Buttons:

```dart
QButton.icon(
                    icon: Icon(Icons.check),
                    onPressed: () {},
                    borderColor: Colors.black,
                    buttonColor: Colors.white38,
                    isEnabled: false,
                  )
```

```dart
QButton.text(
                    text: 'text',
                    disabledColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.white),
                    isEnabled: true,
                    onPressed: () => _key.currentState!.validate(),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                  )
```

```dart
 QButton.textWithLeadingIcon(
                    text: 'Check',
                    leadingIcon: Icon(Icons.check),
                    onPressed: () {},
                    borderRadius: 12,
                    width: 350,
                    height: 44,
                  )
```

```dart
QButton.textWithLeadingAndTrailingIcon(
                    leadingIcon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    trailingIcon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    text: 'Check',
                    textStyle: const TextStyle(color: Colors.white),
                    buttonColor: Colors.pink,
                    onPressed: () {
                      _key.currentState?.validate();
                    },
                  )
```

--Text fields:

```dart
QTextField.email(
                    formKey: _key,
                    controller: emailController,
                    borderColor: Colors.teal,
                  )
```

```dart
QTextField.password(
                    formKey: _key,
                    controller: pwdController,
                    enabled: true,
                  )
```

```dart
QTextField(
                    controller: confirmPasswordController,
                    focusNode: FocusNode(),
                    label: const Text('Confirm password'),
                    formKey: _key,
                    enabled: true,
                  ),
```

## Additional information

link to figma design - https://www.figma.com/file/PBmEeALvddkJbrUVHVBTba/WiP-Q-Reusability-Flutter?node-id=1%3A3

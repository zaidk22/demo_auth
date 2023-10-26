


class Validators {
  const Validators._();

  static final emailRegex = RegExp(
    r"^\S+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
  );
  static final _nameRegex = RegExp(r"[a-zA-Z][a-zA-Z ]+[a-zA-Z]$");
  static final phoneRegex = RegExp(r"^[6-7]{1}\d{8}$");

  static String? fieldRequired(
    String? value,
   {
    String? message,
  }) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    }

    return null;
  }

  static String? fieldRequiredAny(
    dynamic value,
     {
    String? message,
  }) {
    if (value == null) {
      return message ?? 'This field is required';
    }

    return null;
  }


  static String? email(
    String? value,
    
  ) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'Please enter email';
    } else if (value.isNotEmpty && !Validators.emailRegex.hasMatch(value)) {
      return "Please enter valid email";
    } else if (value.length > 100) {
      return  'This field cannot exceed 100 characters';
    }

    return null;
  }





  static String? password(
    String? value,
   
  ) {
    if (value!.isEmpty) {
      return 'Please enter password ';
    } else if (value.length < 6) {
      return 'Password is too short';
    } else if (value.length > 100) {
      return 'This field cannot exceed 100 characters';
    }

    return null;
  }

  static String? name(
    String? value,
    
  ) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'This field is required';
    } 
    // else if (!Validators._nameRegex.hasMatch(value)) {
    //   return 'Invalid name';
    // } 
    else if (value.length > 100) {
      return 'This field cannot exceed 100 characters';
    }

    return null;
  }

 

  static String? postalCode(
    String? value,
   
  ) {
    value = value!.trim();
    if (value.isEmpty) {
      return 'This field is required';
    } else if (value.isNotEmpty && !RegExp(r"^[A-Za-z0-9]+$").hasMatch(value)) {
      return 'Enter valid postal code';
    }

    return null;
  }

 
 
  

}

// IMPORTANT: PLEASE COMMENT OUT SECTION BEFORE RUNNING THE TEST.

// ############################################################################
// #                          Login input test script                         #
// ############################################################################
// describe('AngularJs Homepage', function(){
//   it('Should put a username', function(){
//     browser.get('http://localhost:3000');
//     element(by.id("uname")).sendKeys("Tino");
//     expect(element(by.id("uname")).getAttribute('value')).toBe("Tino");
//   });
//   it('Should put a password', function(){
//     element(by.id("psw")).sendKeys("password");
//     expect(element(by.id("psw")).getAttribute('value')).toBe("password");
//   });
// });

// ############################################################################
// #                        Signup input test script                          #
// ############################################################################
// describe('Signup page user input', function(){
//   it('Should place full name', function(){
//     browser.get('http://localhost:3000/signup');
//     element(by.id("fname")).sendKeys("Tino Liu");
//     expect(element(by.id("fname")).getAttribute('value')).toBe("Tino Liu");
//   });
//   it('Should place username', function(){
//     element(by.id("uname")).sendKeys("cliu");
//     expect(element(by.id("uname")).getAttribute('value')).toBe("cliu");
//   });
//   it('Should place email', function(){
//     element(by.id("email")).sendKeys("cliu@mail.lipscomb.edu");
//     expect(element(by.id("email")).getAttribute('value')).toBe("cliu@mail.lipscomb.edu");
//   });
//   it('Should place password', function(){
//     element(by.id("psw")).sendKeys("123456");
//     expect(element(by.id("psw")).getAttribute('value')).toBe("123456");
//   });
//   it('Should place password agian', function(){
//     element(by.id("psw2")).sendKeys("123456");
//     expect(element(by.id("psw2")).getAttribute('value')).toBe("123456");
//   });
//   it('Should submit', function(){
//    var register = element(by.buttonText('Sign-Up'));
//    var EC = protractor.ExpectedConditions;
//    browser.wait(EC.elementToBeClickable(register),5000);
//    register.click();
//    expect(register.getText()).toBe('Sign-Up');
//   });
// });

// ############################################################################
// #                            Signup success test                           #
// ############################################################################
describe('Test whether if frontend input can go to the database', function(){
  beforeEach(function(){
    browser.get('http://localhost:3000/signup');
  });
  it('Registration should succeed', function(){
    element(by.id("fname")).sendKeys("Tino Liu");
    element(by.id("uname")).sendKeys("cliu");
    element(by.id("email")).sendKeys("clia@lipscomb.edu");
    element(by.id("psw")).sendKeys("123456");
    element(by.id("psw2")).sendKeys("123456");
    element(by.id("submitButton")).click();
    browser.getCurrentUrl().then(function(url){
      expect(url).toEqual("http://localhost:3000/login");
    });
  });
});

const { INTERNAL } = require("@rails/actioncable");
const configYargs = require("webpack-cli/bin/config/config-yargs");

describe("Selects individual product", () => {
  
  it('Load the home page', () => {
    cy.visit('/');
  });

  it('Clicks on Login', () => {
    cy.get('[data-test-id="login"]').click();
  });
  it('Successfully logs user in', () => {
    cy.get('[data-test-id=login_email]').click({force: true}).type("philteigne@gmail.com");
    cy.get('[data-test-id=login_password]').click({force: true}).type("12345678");
    cy.get('.btn').contains('Submit').click();

    cy.get('[data-test-id="current_user"]').contains("Phil Teigne");
  });
  it('Logs out', () => {
    cy.get('[data-test-id="logout"]').click();
  })
  
  it('Clicks on signup page', () => {
    cy.get('[data-test-id=signup]').click();
  });
  it('Populates the signup form', () => {
    cy.get('[data-test-id=first_name] input').click({force: true}).type('Test');
    cy.get('[data-test-id=last_name] input').click({force: true}).type('Test');
    cy.get('[data-test-id=email] input').click({force: true}).type('test@test.com');
    cy.get('[data-test-id=password] input').click({force: true}).type('12345678');
    cy.get('[data-test-id=password_confirmation] input').click({force: true}).type('12345678');
    cy.get('.btn').contains('Submit').click();

    cy.get('[data-test-id="current_user"]').contains("Test Test");
  });
});
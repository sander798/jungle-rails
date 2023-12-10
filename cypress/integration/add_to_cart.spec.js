/// <reference types="cypress" />

describe('Jungle-Rails Home', () => {

  /*beforeEach(() => {
    cy.visit('localhost:3000/')
  })*/

  it('navigates to home page', () => {
    cy.visit('localhost:3000/')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });  

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length.at.least", 2);
  });
  
  it("Adds 1 to the products in cart button when a product's 'Add' button is clicked", () => {
    cy.get(".products article")
      .contains("Add")
      .click({force: true});
      // No matter what I do, clicking on the add button gives an error in cypress
    
    cy.contains("My Cart (1)");
  });
})
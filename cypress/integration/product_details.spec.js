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
  
  it("Clicking on a product goes to its page", () => {
    cy.get(".products article")
      .first()
      .click();

    cy.get(".product-detail").should("exist");
  });
})
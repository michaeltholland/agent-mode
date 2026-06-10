# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository is a workspace used to host Claude Code agent sessions with persistent MCP integrations. It contains no application code — its value is in the connected MCP servers available during sessions.

## Available MCP Integrations

### QuickBooks Online
Provides access to financial data and operations for a connected QBO account:
- **Accounting**: balance sheet, P&L, cash flow, A/R and A/P aging, sales by customer/product
- **Sales**: invoices, estimates, payment links (create, update, send, delete, duplicate)
- **Contacts & Catalog**: search/create customers and products
- **Payroll**: employees, pay types, payslips, deductions, time-off
- **Lending**: peer lending offers
- **Benchmarking**: industry comparisons and recommendations
- **Transactions**: import and profile updates

### Shopify
Provides access to a connected Shopify store:
- **Products & Collections**: search, create, update, bulk status changes, collection management
- **Orders & Customers**: list orders, get order details, list/search customers
- **Inventory**: check levels, set quantities by location
- **Analytics**: ShopifyQL queries for sales and product performance
- **Discounts**: create percentage-based codes
- **GraphQL**: full Shopify Admin API access via `graphql_query` / `graphql_mutation` for resources without a dedicated tool (gift cards, metafields, pages, blogs, markets, translations, etc.)

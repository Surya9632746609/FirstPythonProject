# from playwright.sync_api import sync_playwright
#
# p = sync_playwright().start()
#
# browser = p.chromium.launch(headless=False)
# page = browser.new_page()
# page.goto("https://playwright.dev/")
# page.screenshot(path="example.png")
# browser.close()

# p.stop()


from playwright.sync_api import Playwright, sync_playwright, expect


def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()

    # Open new page
    page = context.new_page()

    # Go to https://portal.syncada.com/USBank/Login.aspx
    page.goto("https://portal.syncada.com/USBank/Login.aspx")

    # Click input[name="ctl00\$Main\$txtUserID"]
    page.locator("input[name=\"ctl00\\$Main\\$txtUserID\"]").click()

    # Fill input[name="ctl00\$Main\$txtUserID"]
    page.locator("input[name=\"ctl00\\$Main\\$txtUserID\"]").fill("regb21")

    # Press Tab
    page.locator("input[name=\"ctl00\\$Main\\$txtUserID\"]").press("Tab")

    # Fill input[name="ctl00\$Main\$txtPassword"]
    page.locator("input[name=\"ctl00\\$Main\\$txtPassword\"]").fill("tester123")

    # Click input:has-text("Log In")
    page.locator("input:has-text(\"Log In\")").click()
    page.wait_for_url("https://portal.syncada.com/USBank/LogIn2.aspx")

    # Click input[name="ctl00\$Main\$txtSecurityQuestionAnswer"]
    page.locator("input[name=\"ctl00\\$Main\\$txtSecurityQuestionAnswer\"]").click()

    # Fill input[name="ctl00\$Main\$txtSecurityQuestionAnswer"]
    page.locator("input[name=\"ctl00\\$Main\\$txtSecurityQuestionAnswer\"]").fill("1")

    # Click input:has-text("Log In")
    page.locator("input:has-text(\"Log In\")").click()
    page.wait_for_url("https://portal.syncada.com/USBank/Home.aspx")

    # Click text=Tableau Data Analytics (new)
    with page.expect_popup() as popup_info:
        page.locator("text=Tableau Data Analytics (new)").click()
    page1 = popup_info.value



    # Go to https://prod-cpts-dataanalytics.usbank.com/ui/index.html
    page1.goto("https://prod-cpts-dataanalytics.usbank.com/ui/index.html")



    # Click text=Total Spend & Shipments
    with page1.expect_popup() as popup_info:
        # await page1.waitForTimeout(50000)  ###########
        # await page1.locator("text=Total Spend & Shipments")
        page1.locator("text=Total Spend & Shipments").click()
    page2 = popup_info.value

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)

# await page.waitForTimeout(20000)
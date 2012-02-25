::User.all.each do |user|
  if user.plugins.where(name: 'registrations').blank?
    user.plugins.create(name: 'registrations', position: (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(::User)

if defined?(::Page)
  page_position = (::Page.maximum(:position, conditions: {parent_id: nil}) || -1)

  registrations_page = ::Page.create({
    title:      'Registration',
    link_url:   '/registrations',
    menu_match: '^/registrations.*$',
    deletable:  false,
    position:   (page_position += 1)
  })
  ::Page.default_parts.each do |default_page_part|
    registrations_page.parts.create(title: default_page_part, body: nil)
  end
  registrations_page_position = -1

  thank_you_page = registrations_page.children.create({
    title:        'Thank You',
    link_url:     '/registrations/thank_you',
    menu_match:   '^/registrations/thank_you$',
    show_in_menu: false,
    deletable:    false,
    position:     (registrations_page_position += 1)
   })
   thank_you_page.parts.create({
     title:       'Body',
     body:        "<p>We've received your application and will email you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>",
     position:    0
   })

  terms_of_agreement_page = registrations_page.children.create({
    title:        'Terms of Agreement',
    link_url:     '/registrations/terms_of_agreement',
    menu_match:   '^/registrations/terms_of_agreement$',
    show_in_menu: false,
    deletable:    true,
    position:     (registrations_page_position += 1)
  })
  terms_of_agreement_page.parts.create({
    title:        "Body",
    position:     0,
    body:         <<-EOS
      <p>
        I, the Parent/Legal guardian agree to the following terms and conditions:
      </p>
      <p>
        Tuition must be paid weekly.
        Each payment is due the Monday prior to the week attending camp.
        This is a one week in advance payment.
        The payment is due on that Monday prior regardless of your child's schedule.
        If you are not sending your child on that Monday, it is your responsibility to pay in advance.
        No child will be allowed to attend until all accounts are current.
      </p>
      <p>
        Example: Week of: June 25-29 Payment Due: Monday June 18.
      </p>
      <p>
        If you are sending your payment by mail, it needs to be received by our office on or before the due date.
        All payments received through mail after the due date will incur a late fee charge of $20.
        All payments that are paid after the Monday prior due date are considered late.
        These payments will need to include $20 as a late fee. <br>
        Credit Card will be accepted as a form of payment for weekly tuition.
        Please note that an additional 3% will be added onto your weekly payment if you pay by credit card.
        Visa, Mastercard, and American Express are accepted.
      </p>
      <p>
        North Jersey Community Coordinated Child Care Agency, Inc. (4C's) will NOT be accepted.
      </p>
      <p>
        The Registration &amp; Activities Fee and Weekly Tuition payments are non-refundable.
      </p>
      <p>
        We will transfer whole weeks but not individual days.
        If your child is sick or does not attend one day that was previously paid for, we will not be held responsible for reimbursement.
        Please Note: We will transfer whole weeks depending on the number of children attending that week.
        We will do our best to accommodate you but cannot guarantee we will have room in that class.
        We cannot be held responsible for any last minute changes in your child's schedule.
      </p>
      <p>
        If you would like to add days to a week that was already paid for,
        this can be done at the discretion of the administration and must be done at least 2 days before the day you wish to add.
        There will be a $20 fee to add days to a week.
      </p>
      <p>
        Bounced checks will incur a $25 bank processing fee.
        After one bounced check, you will be required to pay cash for all tuition payments for the remainder of the Camp season.
      </p>
      <p>
        Extra hour charges will be billed to you based on what time your child was dropped off and picked up.
        Full days are from 8:30am to 3:30pm and extended days are from 7:15am to 6:00pm.
        Extra hour charges are $3 per quarter hour increments.
        If the extra hour charges are after 6:00pm the extra hour charge will be $20 per quarter hour.
        These charges need to be paid the day after you receive notice of extra hour fees.
      </p>
      <p>
        No camper is permitted on the premises before 7:15am.
        Calvary Temple, Camp Calvary or their staff members will not be responsible for your children before their scheduled times.
        You are required to sign your child in and out of Camp.
        No child is allowed to walk into the building or up to the classroom on their own.
        They must be accompanied by an adult at all times.
      </p>
      <p>
        All tuition payments must be made to the Camp Calvary Office.
        Counselors are instructed to not accept tuition payments in the classroom.
        Please do not send your child with tuition checks or cash to be delivered.
        Payments need to be made by the parent to the office.<br>
        On days that a field trip is scheduled, there are no alternate programs for your child to attend.
        By sending your child on these days it is implied that you approve of them attending the scheduled trip.
      </p>
      <p>
        We will do our best to accommodate parental requests of putting certain children in the same class together
        but cannot guarantee that those requests will always be possible depending on our classroom ratios.
      </p>
      <p>
        The development of Christian character and the Christian way of life as shown in the Bible will be an integral part of our program.
      </p>
      <p>
        Permission is hereby granted to Camp Calvary for photographs and video to be taken of my child and used for promotional materials.
      </p>
      <p>
        Each child's legal guardian will be responsible to meet all financial obligations as outlined in this agreement.
        If fees are not paid in full, the legal guardian shall be liable for all costs of collection, including attorney fees.
        If your account is not kept current, or your check has bounced, Camp Calvary reserves the right to dismiss your child
        from our program until you have paid in full any outstanding balance.
      </p>
    EOS
  })
  terms_of_agreement_page.parts.create({
    title:        'Side Body',
    position:     1,
    body:         <<-EOS
      <p>
        Camp Calvary - A Ministry of Calvary Temple<br>
        1111 Preakness Avenue, Wayne, NJ 07470<br>
        <span id="gc-number-0" class="gc-cs-link" title="Call with Google Voice">973.694.8140</span>
      </p>
    EOS
  })
end

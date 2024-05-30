import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<Map<String, String>> _faqList = [
    {
      'question': 'How can I book a train ticket?',
      'answer': 'You can book a train ticket by selecting your departure and arrival stations, choosing your travel dates, and selecting the number of passengers. Then, you can choose your preferred train and complete the payment process.',
    },
    {
      'question': 'Can I cancel a booked ticket?',
      'answer': 'Yes, you can cancel a booked ticket through the app. Go to the \'My Tickets\' section, select the ticket you want to cancel, and follow the prompts to complete the cancellation process.',
    },
    {
      'question': 'How will I receive my refund after canceling a ticket?',
      'answer': 'The refund will be processed and credited back to your original payment method within 2-3 business days.',
    },
    {
      'question': 'How can I contact customer support?',
      'answer': 'You can contact customer support by calling our helpline number at 8281 or by emailing us at support@traintickets.com.',
    },
    {
      'question': 'Are there any discounts available for children or senior citizens?',
      'answer': 'Yes, discounts are available for children and senior citizens. Please check the details during the booking process for the applicable discounts.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: _faqList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Text(
                _faqList[index]['question']!,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    _faqList[index]['answer']!,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

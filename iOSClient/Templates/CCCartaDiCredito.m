//
//  CCCartaDiCreditoViewController.m
//  Crypto Cloud Technology Nextcloud
//
//  Created by Marino Faggiana on 20/11/14.
//  Copyright (c) 2014 TWS. All rights reserved.
//
//  Author Marino Faggiana <m.faggiana@twsweb.it>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "CCCartaDiCredito.h"
#import "AppDelegate.h"

@interface CCCartaDiCredito()
{
    XLFormDescriptor *form ;
    NSTimer* myTimer;
    NSMutableDictionary *field;
    CCTemplates *templates;
}
@end

@implementation CCCartaDiCredito

- (id)initWithDelegate:(id <CCCartaDiCreditoDelegate>)delegate fileName:(NSString *)fileName uuid:(NSString *)uuid rev:(NSString *)rev fileID:(NSString *)fileID modelReadOnly:(BOOL)modelReadOnly isLocal:(BOOL)isLocal
{
    self = [super init];
    
    if (self) {
        
        self.delegate = delegate;
        self.fileName = fileName;
        self.isLocal = isLocal;
        self.rev = rev;
        self.fileID = fileID;
        self.uuid = uuid;
        
        CCCrypto *crypto = [[CCCrypto alloc] init];
        
        // if fileName read Crypto File
        if (fileName)
            field = [crypto getDictionaryEncrypted:fileName uuid:uuid isLocal:isLocal directoryUser:app.directoryUser];
        
        //XLFormDescriptor * form ;
        XLFormSectionDescriptor * section;
        XLFormRowDescriptor * row;
  
        // Information - Section
        form = [XLFormDescriptor formDescriptor];
        section = [XLFormSectionDescriptor formSectionWithTitle:NSLocalizedString(@"_title_", nil)];
        [form addFormSection:section];
        if (!fileName) form.assignFirstResponderOnShow = YES;
        
        // Titolo
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"titolo" rowType:XLFormRowDescriptorTypeText];
        [row.cellConfig setObject:COLOR_ENCRYPTED forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"titolo"];
        row.required = YES;
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];

        section = [XLFormSectionDescriptor formSectionWithTitle:NSLocalizedString(@"_credi_card_data_", nil)];
        [form addFormSection:section];
        
        // Nome Banca
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"nomebanca" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_bank_name:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"nomebanca"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];

        // CODE
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"code" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_code:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"code"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];
        
        // Secur Code
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"securcode" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_security_code:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"securcode"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];

        // PIN
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pin" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_pin:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"pin"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];
        
        // Nome Conognome
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"nomecognome" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_name_surname:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"nomecognome"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];
        
        // Scadenza
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"scadenza" rowType:XLFormRowDescriptorTypeText title:NSLocalizedString(@"_expiry_date:_", nil)];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textField.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textLabel.font"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textField.font"];
        row.value = [field objectForKey:@"scadenza"];
        if (modelReadOnly) row.disabled = @YES;
        [section addFormRow:row];
        
        section = [XLFormSectionDescriptor formSectionWithTitle:NSLocalizedString(@"_notes_", nil)];
        [form addFormSection:section];
        
        // Note
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"note" rowType:XLFormRowDescriptorTypeTextView];
        row.value = [field objectForKey:@"note"];
        [row.cellConfig setObject:COLOR_GRAY forKey:@"textView.textColor"];
        [row.cellConfig setObject:[UIFont systemFontOfSize:15.0]forKey:@"textView.font"];
        [section addFormRow:row];

        self.form = form;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
        
        if (modelReadOnly) self.navigationItem.rightBarButtonItem = nil;
        else self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePressed:)];

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    templates = [[CCTemplates alloc] init];
    
    [templates setImageTitle:NSLocalizedString(@"_credit_card_", nil) conNavigationItem:self.navigationItem reachability:[app.reachability isReachable]];
        
    // Color
    [CCAspect aspectNavigationControllerBar:self.navigationController.navigationBar hidden:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.fileName && !field) [self performSelector:@selector(cancelPressed:) withObject:nil afterDelay:0.5];
}

- (void)didSelectFormRow:(XLFormRowDescriptor *)formRow
{
    [super didSelectFormRow:formRow];
    
    if ([formRow.tag isEqual:@"mytag"]) {
        // do your thing for your row.
    }
}

#pragma --------------------------------------------------------------------------------------------
#pragma mark - ==== IBAction ====
#pragma --------------------------------------------------------------------------------------------

- (IBAction)cancelPressed:(UIBarButtonItem * __unused)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePressed:(UIBarButtonItem * __unused)button
{
    NSString *fileNameModel;
    
    NSArray *validationErrors = [self formValidationErrors];
    if (validationErrors.count > 0){
        //NSError *error = [validationErrors firstObject];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"_error_", nil) message:NSLocalizedString(@"_enter_title_", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"_ok_", nil) otherButtonTitles:nil];
        [alertView show];
        return;
    }
    [self.tableView endEditing:YES];
    
    fileNameModel = [templates salvaForm:form fileName:self.fileName uuid:self.uuid modello:@"cartadicredito" icona:@"cartadicredito"];
    
    if (fileNameModel) {
        
        XLFormRowDescriptor *titolo = [self.form formRowWithTag:@"titolo"];
        
        CCMetadataNet *metadataNet = [[CCMetadataNet alloc] initWithAccount:app.activeAccount];
        
        metadataNet.action = actionUploadTemplate;
        metadataNet.serverUrl = app.serverUrl;
        metadataNet.fileName = [CCUtility trasformedFileNamePlistInCrypto:fileNameModel];
        metadataNet.fileNamePrint = titolo.value;
        metadataNet.pathFolder = NSTemporaryDirectory();
        metadataNet.rev = self.rev;
        metadataNet.session = upload_session_foreground;
        metadataNet.taskStatus = taskStatusResume;
        
        [app addNetworkingOperationQueue:app.netQueue delegate:self.delegate metadataNet:metadataNet oneByOne:YES];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end